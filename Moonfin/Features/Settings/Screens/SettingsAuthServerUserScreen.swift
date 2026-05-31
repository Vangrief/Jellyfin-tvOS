import SwiftUI

struct SettingsAuthServerUserScreen: View {
    let serverId: String
    let userId: String
    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @State private var showDeleteAlert = false

    private var server: Server? {
        container.serverRepository.storedServers.value.first { $0.id.uuidString == serverId }
    }

    private var user: PrivateUser? {
        guard let server else { return nil }
        return container.serverUserRepository.getStoredServerUsers(server: server)
            .first { $0.id.uuidString == userId }
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsAuthServerUserScreenAccount) {
            if let server, let user {
                userHeader(user, server: server)

                Divider()
                    .background(theme.colorScheme.listCaption.opacity(0.3))
                    .padding(.vertical, SpaceTokens.spaceXs)

                if user.accessToken != nil {
                    Button(action: {
                        _ = container.authenticationRepository.logout(user: user)
                        settingsRouter.goBack()
                    }) {
                        FocusAwareActionLabel(icon: "rectangle.portrait.and.arrow.right", text: Strings.settingsAuthServerUserScreenSignOut)
                    }
                    .buttonStyle(CleanButtonStyle())
                }

                Button(action: { showDeleteAlert = true }) {
                    FocusAwareActionLabel(icon: "trash", text: Strings.settingsAuthServerUserScreenRemoveAccount, color: .red)
                }
                .buttonStyle(CleanButtonStyle())
                .alert(Strings.settingsAuthServerUserScreenRemoveAccount, isPresented: $showDeleteAlert) {
                    Button(Strings.cancel, role: .cancel) {}
                    Button(Strings.remove, role: .destructive) {
                        container.serverUserRepository.deleteStoredUser(user)
                        settingsRouter.goBack()
                    }
                } message: {
                    Text(Strings.settingsAuthServerUserScreenRemoveUserFromDevice(user.name))
                }
            }
        }
    }

    private func userHeader(_ user: PrivateUser, server: Server) -> some View {
        VStack(spacing: SpaceTokens.spaceSm) {
            SettingsUserAvatarView(user: user, server: server, size: 64)

            Text(user.name)
                .font(.bodyLg)
                .fontWeight(.semibold)
                .foregroundColor(theme.colorScheme.onBackground)

            Text(server.name)
                .font(.captionXs)
                .foregroundColor(theme.colorScheme.listCaption)

            if user.accessToken != nil {
                HStack(spacing: SpaceTokens.space2xs) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 12))
                    Text(Strings.settingsAuthServerUserScreenSignedIn)
                        .font(.captionXs)
                }
                .foregroundColor(theme.accent)
            } else {
                Text(Strings.settingsAuthServerUserScreenNotSignedIn)
                    .font(.captionXs)
                    .foregroundColor(theme.colorScheme.listCaption)
            }

            if let lastUsed = user.lastUsed {
                Text(Strings.lastUsedAgo(lastUsed.formatted(.relative(presentation: .named))))
                    .font(.captionXs)
                    .foregroundColor(theme.colorScheme.listCaption)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, SpaceTokens.spaceSm)
    }

}
