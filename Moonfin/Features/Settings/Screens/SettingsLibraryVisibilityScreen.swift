import SwiftUI

private struct LibraryVisibilityEntry: Identifiable, Hashable {
    let id: String
    let name: String
}

private struct LibraryVisibilityConfig {
    var myMediaExcludes: Set<String>
    var latestItemsExcludes: Set<String>
}

private enum LibraryVisibilityToggleTarget: Hashable {
    case navigation(String)
    case latest(String)
}

struct SettingsLibraryVisibilityScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var theme: MoonfinTheme

    @State private var libraries: [LibraryVisibilityEntry] = []
    @State private var config = LibraryVisibilityConfig(myMediaExcludes: [], latestItemsExcludes: [])
    @State private var userId: String?
    @State private var userConfigurationJSON: [String: Any] = [:]
    @State private var isLoading = true
    @State private var hasLoaded = false

    @State private var saveQueueTask: Task<Void, Never>?
    @State private var lastQueuedOperationId = 0

    @FocusState private var focusedToggle: LibraryVisibilityToggleTarget?

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsLibraryVisibility) {
            Text(Strings.settingsLibraryVisibilityDescription)
                .font(.captionXs)
                .foregroundColor(.secondary)
                .padding(.horizontal, SpaceTokens.spaceMd)
                .padding(.bottom, SpaceTokens.spaceXs)

            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, SpaceTokens.spaceLg)
            } else if libraries.isEmpty {
                Text(Strings.settingsLibraryVisibilityNoLibraries)
                    .font(.bodyMd)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, SpaceTokens.spaceLg)
            } else {
                ForEach(libraries) { library in
                    VStack(alignment: .leading, spacing: SpaceTokens.spaceXs) {
                        Text(library.name)
                            .font(.captionXs)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, SpaceTokens.spaceMd)
                            .padding(.top, SpaceTokens.spaceSm)

                        toggleRow(
                            icon: "eye",
                            heading: Strings.settingsLibraryVisibilityShowInNavigation,
                            target: .navigation(library.id),
                            isOn: !config.myMediaExcludes.contains(library.id)
                        ) {
                            toggleExclude(for: library.id, isLatest: false)
                        }

                        toggleRow(
                            icon: "sparkles",
                            heading: Strings.settingsLibraryVisibilityShowInLatestMedia,
                            target: .latest(library.id),
                            isOn: !config.latestItemsExcludes.contains(library.id)
                        ) {
                            toggleExclude(for: library.id, isLatest: true)
                        }
                    }
                }
            }
        }
        .task {
            guard !hasLoaded else { return }
            hasLoaded = true
            await loadData()
        }
    }

    private func toggleRow(
        icon: String,
        heading: String,
        target: LibraryVisibilityToggleTarget,
        isOn: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            SettingsItemContent(icon: icon, heading: heading, caption: nil) { isFocused in
                Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                    .font(.bodyLg)
                    .foregroundColor(isOn
                        ? (isFocused ? theme.colorScheme.listHeadlineFocused : theme.accent)
                        : (isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption))
            }
        }
        .buttonStyle(CleanButtonStyle())
        .focused($focusedToggle, equals: target)
    }

    private func loadData() async {
        guard let context = resolveUserContext(),
              let client = makeHttpClient(for: context.serverId, userId: context.userId) else {
            await MainActor.run {
                libraries = []
                isLoading = false
            }
            return
        }

        await MainActor.run {
            userId = context.userId
        }

        async let viewsTask: [LibraryVisibilityEntry] = fetchLibraries(client: client, userId: context.userId)
        async let configTask: (LibraryVisibilityConfig, [String: Any]) = fetchUserConfig(client: client, userId: context.userId)

        let fetchedLibraries = await viewsTask
        let fetchedConfigResult = await configTask

        await MainActor.run {
            libraries = fetchedLibraries
            config = fetchedConfigResult.0
            userConfigurationJSON = fetchedConfigResult.1
            isLoading = false
            applyInitialFocusIfNeeded()
        }
    }

    private func applyInitialFocusIfNeeded() {
        guard focusedToggle == nil,
              let firstLibrary = libraries.first else { return }

        DispatchQueue.main.async {
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) {
                focusedToggle = .navigation(firstLibrary.id)
            }
        }
    }

    private func toggleExclude(for libraryId: String, isLatest: Bool) {
        guard userId != nil else { return }

        let previousConfig = config
        var nextConfig = config

        if isLatest {
            if nextConfig.latestItemsExcludes.contains(libraryId) {
                nextConfig.latestItemsExcludes.remove(libraryId)
            } else {
                nextConfig.latestItemsExcludes.insert(libraryId)
            }
        } else {
            if nextConfig.myMediaExcludes.contains(libraryId) {
                nextConfig.myMediaExcludes.remove(libraryId)
            } else {
                nextConfig.myMediaExcludes.insert(libraryId)
            }
        }

        config = nextConfig

        let operationId = lastQueuedOperationId + 1
        lastQueuedOperationId = operationId

        enqueueSave(operationId: operationId, previousConfig: previousConfig, updatedConfig: nextConfig)
    }

    private func enqueueSave(
        operationId: Int,
        previousConfig: LibraryVisibilityConfig,
        updatedConfig: LibraryVisibilityConfig
    ) {
        guard let userId,
              let context = resolveUserContext(),
              let client = makeHttpClient(for: context.serverId, userId: context.userId) else {
            return
        }

        let previousTask = saveQueueTask
        saveQueueTask = Task {
            _ = await previousTask?.result
            await persistConfig(
                operationId: operationId,
                previousConfig: previousConfig,
                updatedConfig: updatedConfig,
                client: client,
                userId: userId
            )
        }
    }

    private func persistConfig(
        operationId: Int,
        previousConfig: LibraryVisibilityConfig,
        updatedConfig: LibraryVisibilityConfig,
        client: HttpClient,
        userId: String
    ) async {
        var payloadConfig = userConfigurationJSON
        payloadConfig["MyMediaExcludes"] = Array(updatedConfig.myMediaExcludes).sorted()
        payloadConfig["LatestItemsExcludes"] = Array(updatedConfig.latestItemsExcludes).sorted()

        do {
            let data = try JSONSerialization.data(withJSONObject: payloadConfig)
            try await client.postRaw("/Users/\(userId)/Configuration", rawBody: data)

            await MainActor.run {
                userConfigurationJSON = payloadConfig
                container.userViewsService.refreshCurrentContext()
                container.dataRefreshService.recordLibraryChange()
                NotificationCenter.default.post(name: .libraryVisibilityDidChange, object: nil)
            }
        } catch {
            await MainActor.run {
                guard operationId == lastQueuedOperationId else { return }
                config = previousConfig
            }
        }
    }

    private func fetchLibraries(client: HttpClient, userId: String) async -> [LibraryVisibilityEntry] {
        if let adminLibraries = await fetchAdminLibraries(client: client), !adminLibraries.isEmpty {
            return adminLibraries
        }

        let userViews = await container.userViewsService.awaitLoaded()
        return userViews
            .map { LibraryVisibilityEntry(id: $0.id, name: $0.name) }
            .sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
    }

    private func fetchAdminLibraries(client: HttpClient) async -> [LibraryVisibilityEntry]? {
        do {
            let data = try await client.requestData("/Library/MediaFolders")
            let json = try JSONSerialization.jsonObject(with: data)

            let items: [[String: Any]]
            if let object = json as? [String: Any],
               let objectItems = object["Items"] as? [[String: Any]] {
                items = objectItems
            } else if let array = json as? [[String: Any]] {
                items = array
            } else {
                return nil
            }

            let libraries = items.compactMap { item -> LibraryVisibilityEntry? in
                let id = (item["ItemId"] as? String) ?? (item["Id"] as? String)
                let name = item["Name"] as? String
                guard let id, !id.isEmpty, let name, !name.isEmpty else { return nil }
                return LibraryVisibilityEntry(id: id, name: name)
            }

            return libraries.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
        } catch {
            return nil
        }
    }

    private func fetchUserConfig(client: HttpClient, userId: String) async -> (LibraryVisibilityConfig, [String: Any]) {
        do {
            let data = try await client.requestData("/Users/\(userId)")
            guard let userJSON = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let configuration = userJSON["Configuration"] as? [String: Any] else {
                return (LibraryVisibilityConfig(myMediaExcludes: [], latestItemsExcludes: []), [:])
            }

            let myMedia = Set(configuration["MyMediaExcludes"] as? [String] ?? [])
            let latest = Set(configuration["LatestItemsExcludes"] as? [String] ?? [])
            return (LibraryVisibilityConfig(myMediaExcludes: myMedia, latestItemsExcludes: latest), configuration)
        } catch {
            return (LibraryVisibilityConfig(myMediaExcludes: [], latestItemsExcludes: []), [:])
        }
    }

    private func resolveUserContext() -> (serverId: UUID, userId: String)? {
        guard let currentServer = container.serverRepository.currentServer.value else {
            return nil
        }

        if let session = container.sessionRepository.currentSession.value,
           session.serverId == currentServer.id {
            return (currentServer.id, session.userId.uuidString)
        }

        return container.userRepository.currentUser.value.map { (currentServer.id, $0.id) }
    }

    private func makeHttpClient(for serverId: UUID, userId: String) -> HttpClient? {
        guard let server = container.serverRepository.storedServers.value.first(where: { $0.id == serverId })
            ?? container.serverRepository.currentServer.value else {
            return nil
        }

        let accessToken: String
        if let currentSession = container.sessionRepository.currentSession.value,
           currentSession.serverId == serverId,
           currentSession.userId.uuidString == userId {
            accessToken = currentSession.accessToken
        } else if let userUUID = UUID(uuidString: userId),
                  let token = container.authenticationStore.getUser(serverId, userUUID)?.accessToken,
                  !token.isEmpty {
            accessToken = token
        } else {
            return nil
        }

        return container.serverClientFactory.configuredClient(
            for: server,
            accessToken: accessToken,
            userId: userId
        ).httpClient
    }
}
