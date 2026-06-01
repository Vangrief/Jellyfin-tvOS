import SwiftUI

struct SettingsIntegrationsScreen: View {
    @FocusState private var focusedRoute: SettingsRoute?

    var body: some View {
        SettingsScreenLayout(title: Strings.integrations) {
            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .plugin,
                icon: "puzzlepiece.extension",
                heading: Strings.plugin,
                caption: Strings.settingsIntegrationsScreenPluginCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .integrationsMetadataRatings,
                icon: "star.fill",
                heading: Strings.settingsIntegrationsScreenMetadataAndRatings,
                caption: Strings.settingsIntegrationsScreenMetadataAndRatingsCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .seerr,
                icon: "asset:settings-seerr",
                heading: Strings.seerrTitle,
                caption: Strings.settingsIntegrationsScreenSeerrCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .integrationsHomeScreenSections,
                icon: "asset:settings-hss",
                heading: Strings.settingsIntegrationsScreenHomeScreenSections,
                caption: Strings.settingsIntegrationsScreenHomeScreenSectionsCaption
            )
        }
        .restoresFocus($focusedRoute)
    }
}

struct SettingsHomeScreenSectionsIntegrationScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter

    @FocusState private var focusedRoute: SettingsRoute?
    @State private var refreshTrigger = 0
    @State private var statusText: String?

    private var capability: HomeScreenSectionsCapability? {
        container.homeScreenSectionsService.activeCapability
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsIntegrationsScreenHomeScreenSections) {
            let _ = refreshTrigger

            HomeSectionsStatusRow(
                icon: "server.rack",
                heading: Strings.settingsIntegrationsScreenActiveServer,
                caption: activeServerAddress,
                value: activeServerName
            )

            HomeSectionsStatusRow(
                icon: "puzzlepiece.extension",
                heading: Strings.settingsIntegrationsScreenPluginStatus,
                caption: Strings.settingsIntegrationsScreenPluginStatusCaption,
                value: pluginStatusText
            )

            HomeSectionsStatusRow(
                icon: "number",
                heading: Strings.settingsIntegrationsScreenDiscoveredSections,
                caption: Strings.settingsIntegrationsScreenDiscoveredSectionsCaption,
                value: "\(capability?.sections.count ?? 0)"
            )

            HomeSectionsStatusRow(
                icon: "tag",
                heading: Strings.settingsIntegrationsScreenPluginVersion,
                caption: Strings.settingsIntegrationsScreenPluginVersionCaption,
                value: capability?.pluginVersion ?? Strings.unknown
            )

            HomeSectionsStatusRow(
                icon: "clock",
                heading: Strings.settingsIntegrationsScreenLastUpdated,
                caption: Strings.settingsIntegrationsScreenLastUpdatedCaption,
                value: formattedLastUpdated
            )

            if let errorText = capability?.lastErrorDescription, !errorText.isEmpty {
                HomeSectionsStatusRow(
                    icon: "exclamationmark.triangle",
                    heading: Strings.settingsIntegrationsScreenLastError,
                    caption: Strings.settingsIntegrationsScreenLastErrorCaption,
                    value: errorText
                )
            }

            SettingsListButton(
                icon: "arrow.clockwise",
                heading: Strings.settingsIntegrationsScreenRefreshStatus,
                caption: Strings.settingsIntegrationsScreenRefreshStatusCaption,
                action: {
                    Task {
                        await container.homeScreenSectionsService.refreshActiveServerNow()
                        statusText = Strings.settingsIntegrationsScreenStatusRefreshed
                        refreshTrigger += 1
                    }
                }
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .homeSections,
                icon: "list.bullet",
                heading: Strings.settingsIntegrationsScreenManageHomeSections,
                caption: Strings.settingsIntegrationsScreenManageHomeSectionsCaption
            )

            if let statusText {
                Text(statusText)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, SpaceTokens.spaceMd)
            }
        }
        .onAppear {
            container.homeScreenSectionsService.requestRefresh()
        }
        .onReceive(container.homeScreenSectionsService.$refreshCompletedCount) { _ in
            refreshTrigger += 1
        }
        .onReceive(container.pluginSyncService.$syncCompletedCount.dropFirst()) { _ in
            container.homeScreenSectionsService.requestRefresh()
        }
        .restoresFocus($focusedRoute)
    }

    private var activeServerName: String {
        container.serverRepository.currentServer.value?.name ?? Strings.settingsIntegrationsScreenNotConnected
    }

    private var activeServerAddress: String? {
        container.serverRepository.currentServer.value?.address
    }

    private var pluginStatusText: String {
        guard let capability else { return Strings.unknown }
        if !capability.installed { return Strings.settingsIntegrationsScreenNotInstalled }
        return capability.enabled ? Strings.settingsIntegrationsScreenInstalledEnabled : Strings.settingsIntegrationsScreenInstalledDisabled
    }

    private var formattedLastUpdated: String {
        guard let updatedAt = capability?.lastUpdatedAt else { return Strings.never }
        return Self.dateFormatter.string(from: updatedAt)
    }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}

private struct HomeSectionsStatusRow: View {
    let icon: String
    let heading: String
    let caption: String?
    let value: String

    @EnvironmentObject var theme: MoonfinTheme

    var body: some View {
        SettingsItemContent(icon: icon, heading: heading, caption: caption) { isFocused in
            Text(value)
                .font(.captionXs)
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .foregroundColor(isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption)
        }
    }
}
