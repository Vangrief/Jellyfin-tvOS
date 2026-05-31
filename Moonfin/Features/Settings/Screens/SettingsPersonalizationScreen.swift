import SwiftUI

struct SettingsPersonalizationScreen: View {
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsPersonalizationScreenTitle) {
            SettingsListButton(
                icon: "paintbrush.pointed",
                heading: Strings.settingsPersonalizationScreenGeneralStyle,
                caption: Strings.settingsPersonalizationScreenGeneralStyleCaption,
                action: { settingsRouter.navigate(to: .personalizationGeneralStyle) }
            )
            .focused($focusedRoute, equals: .personalizationGeneralStyle)

            SettingsListButton(
                icon: "sidebar.left",
                heading: Strings.settingsPersonalizationScreenNavigation,
                caption: Strings.settingsPersonalizationScreenNavigationCaption,
                action: { settingsRouter.navigate(to: .personalizationNavigation) }
            )
            .focused($focusedRoute, equals: .personalizationNavigation)

            SettingsListButton(
                icon: "house",
                heading: Strings.settingsPersonalizationScreenHomeScreen,
                caption: Strings.settingsPersonalizationScreenHomeScreenCaption,
                action: { settingsRouter.navigate(to: .home) }
            )
            .focused($focusedRoute, equals: .home)

            SettingsListButton(
                icon: "books.vertical",
                heading: Strings.settingsPersonalizationScreenLibraries,
                caption: Strings.settingsPersonalizationScreenLibrariesCaption,
                action: { settingsRouter.navigate(to: .libraries) }
            )
            .focused($focusedRoute, equals: .libraries)

            SettingsListButton(
                icon: "sparkles",
                heading: Strings.screensaver,
                caption: Strings.settingsPersonalizationScreenScreensaverCaption,
                action: { settingsRouter.navigate(to: .customizationScreensaver) }
            )
            .focused($focusedRoute, equals: .customizationScreensaver)
        }
        .restoresFocus($focusedRoute)
    }
}
