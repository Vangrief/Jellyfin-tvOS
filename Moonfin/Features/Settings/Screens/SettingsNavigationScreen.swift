import SwiftUI

struct SettingsNavigationScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsNavigationScreenNavigation) {
            SettingsListButton(
                icon: "sidebar.left",
                heading: Strings.settingsNavigationScreenNavigationStyle,
                caption: Strings.settingsNavigationScreenChooseTopOrLeftNavigation,
                trailingText: prefs[UserPreferences.navbarPosition].displayName,
                action: { settingsRouter.navigate(to: .moonfinNavbarPosition) }
            )
            .focused($focusedRoute, equals: .moonfinNavbarPosition)

            SettingsListButton(
                icon: "paintpalette",
                heading: Strings.settingsNavigationScreenNavbarColor,
                caption: Strings.settingsNavigationScreenChooseNavbarColor,
                trailingText: prefs[UserPreferences.navbarColor].displayName,
                action: { settingsRouter.navigate(to: .moonfinNavbarColor) }
            )
            .focused($focusedRoute, equals: .moonfinNavbarColor)

            SettingsListButton(
                icon: "circle.lefthalf.filled.inverse",
                heading: Strings.settingsNavigationScreenNavbarOpacity,
                caption: Strings.settingsNavigationScreenSetNavbarOpacityPercentage,
                trailingText: "\(prefs[UserPreferences.navbarOpacity])%",
                action: { settingsRouter.navigate(to: .moonfinNavbarOpacity) }
            )
            .focused($focusedRoute, equals: .moonfinNavbarOpacity)

            SettingsToggleButton(
                icon: "shuffle",
                heading: Strings.settingsNavigationScreenShowShuffleButton,
                caption: Strings.settingsNavigationScreenDisplayTheShuffleShortcut,
                isOn: prefs.binding(for: UserPreferences.showShuffleButton)
            )

            SettingsListButton(
                icon: "shuffle",
                heading: Strings.settingsNavigationScreenShuffleContentTypeFilter,
                caption: Strings.settingsNavigationScreenRestrictShuffleToAContentType,
                trailingText: prefs[UserPreferences.shuffleContentType].displayName,
                action: { settingsRouter.navigate(to: .moonfinShuffleContentType) }
            )
            .focused($focusedRoute, equals: .moonfinShuffleContentType)

            SettingsToggleButton(
                icon: "theatermasks",
                heading: Strings.settingsNavigationScreenShowGenresButton,
                caption: Strings.settingsNavigationScreenDisplayTheGenresShortcut,
                isOn: prefs.binding(for: UserPreferences.showGenresButton)
            )

            SettingsToggleButton(
                icon: "heart.fill",
                heading: Strings.settingsNavigationScreenShowFavoritesButton,
                caption: Strings.settingsNavigationScreenDisplayTheFavoritesShortcut,
                isOn: prefs.binding(for: UserPreferences.showFavoritesButton)
            )

            SettingsToggleButton(
                icon: "movieclapper.fill",
                heading: Strings.settingsNavigationScreenShowLibrariesInToolbar,
                caption: Strings.settingsNavigationScreenDisplayTheLibrariesShortcut,
                isOn: prefs.binding(for: UserPreferences.showLibrariesInToolbar)
            )
        }
        .restoresFocus($focusedRoute)
    }
}
