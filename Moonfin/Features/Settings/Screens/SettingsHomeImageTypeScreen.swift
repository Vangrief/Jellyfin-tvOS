import SwiftUI

struct SettingsHomeImageTypeScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsImageType) {
            SettingsListButton(
                icon: "play.rectangle",
                heading: Strings.settingsHomeImageTypeScreenContinueWatching,
                caption: Strings.settingsHomeImageTypeScreenContinueWatchingCaption,
                trailingText: prefs[UserPreferences.homeImageTypeContinueWatching].displayName,
                action: { settingsRouter.navigate(to: .homeImageTypeContinueWatching) }
            )
            .focused($focusedRoute, equals: .homeImageTypeContinueWatching)

            SettingsListButton(
                icon: "sparkles.rectangle.stack",
                heading: Strings.settingsHomeImageTypeScreenNextUp,
                caption: Strings.settingsHomeImageTypeScreenNextUpCaption,
                trailingText: prefs[UserPreferences.homeImageTypeNextUp].displayName,
                action: { settingsRouter.navigate(to: .homeImageTypeNextUp) }
            )
            .focused($focusedRoute, equals: .homeImageTypeNextUp)

            SettingsListButton(
                icon: "rectangle.grid.1x2",
                heading: Strings.settingsHomeImageTypeScreenMyMedia,
                caption: Strings.settingsHomeImageTypeScreenMyMediaCaption,
                trailingText: prefs[UserPreferences.homeImageTypeMyMedia].displayName,
                action: { settingsRouter.navigate(to: .homeImageTypeMyMedia) }
            )
            .focused($focusedRoute, equals: .homeImageTypeMyMedia)

            SettingsListButton(
                icon: "rectangle.stack",
                heading: Strings.libraries,
                caption: Strings.settingsHomeImageTypeScreenLibrariesCaption,
                trailingText: prefs[UserPreferences.homeImageTypeLibraries].displayName,
                action: { settingsRouter.navigate(to: .homeImageTypeLibraries) }
            )
            .focused($focusedRoute, equals: .homeImageTypeLibraries)

            SettingsListButton(
                icon: "tv",
                heading: Strings.liveTv,
                caption: Strings.settingsHomeImageTypeScreenLiveTvCaption,
                trailingText: prefs[UserPreferences.homeImageTypeLiveTv].displayName,
                action: { settingsRouter.navigate(to: .homeImageTypeLiveTv) }
            )
            .focused($focusedRoute, equals: .homeImageTypeLiveTv)
        }
        .restoresFocus($focusedRoute)
    }
}
