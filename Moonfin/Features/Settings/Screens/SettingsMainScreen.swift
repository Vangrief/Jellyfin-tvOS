import SwiftUI

struct SettingsMainScreen: View {
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?
    @Namespace private var screenNamespace

    var body: some View {
        SettingsScreenLayout(title: Strings.settings) {
            SettingsListButton(
                icon: "lock",
                heading: Strings.settingsMainScreenAccountAndSecurity,
                caption: Strings.settingsMainScreenAccountAndSecurityCaption,
                action: { settingsRouter.navigate(to: .accountAndSecurity) }
            )
            .focused($focusedRoute, equals: .accountAndSecurity)
            .prefersDefaultFocus(in: screenNamespace)

            SettingsListButton(
                icon: "paintpalette",
                heading: Strings.settingsMainScreenPersonalization,
                caption: Strings.settingsMainScreenPersonalizationCaption,
                action: { settingsRouter.navigate(to: .personalization) }
            )
            .focused($focusedRoute, equals: .personalization)

            SettingsListButton(
                icon: "rectangle.inset.filled",
                heading: Strings.settingsMainScreenDynamicContent,
                caption: Strings.settingsMainScreenDynamicContentCaption,
                action: { settingsRouter.navigate(to: .dynamicContent) }
            )
            .focused($focusedRoute, equals: .dynamicContent)

            SettingsListButton(
                icon: "play.circle",
                heading: Strings.settingsMainScreenPlaybackAndSyncPlay,
                caption: Strings.settingsMainScreenPlaybackAndSyncPlayCaption,
                action: { settingsRouter.navigate(to: .playbackAndSyncPlay) }
            )
            .focused($focusedRoute, equals: .playbackAndSyncPlay)

            SettingsListButton(
                icon: "puzzlepiece.extension",
                heading: Strings.integrations,
                caption: Strings.settingsMainScreenIntegrationsCaption,
                action: { settingsRouter.navigate(to: .integrations) }
            )
            .focused($focusedRoute, equals: .integrations)

            SettingsListButton(
                icon: "info.circle",
                heading: Strings.about,
                caption: Strings.settingsMainScreenAboutCaption,
                action: { settingsRouter.navigate(to: .about) }
            )
            .focused($focusedRoute, equals: .about)
        }
        .focusScope(screenNamespace)
        .defaultFocus($focusedRoute, .accountAndSecurity)
        .restoresFocus($focusedRoute)
        .onAppear {
            guard settingsRouter.path.count == 1,
                  settingsRouter.path.first == .main,
                  settingsRouter.lastPoppedRoute == nil else { return }
            focusedRoute = .accountAndSecurity
        }
    }
}
