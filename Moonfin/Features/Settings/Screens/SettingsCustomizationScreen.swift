import SwiftUI

struct SettingsCustomizationScreen: View {
    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.customization) {
            SettingsListButton(
                icon: "paintpalette",
                heading: Strings.settingsCustomizationScreenAppearanceTheme,
                caption: Strings.settingsCustomizationScreenAppearanceThemeCaption,
                trailingText: theme.activeSpec.displayName,
                action: { settingsRouter.navigate(to: .customizationAppearanceTheme) }
            )
            .focused($focusedRoute, equals: .customizationAppearanceTheme)

            SettingsListButton(
                icon: "circle.lefthalf.filled",
                heading: Strings.settingsCustomizationScreenFocusBorderColor,
                caption: Strings.settingsCustomizationScreenFocusBorderColorCaption,
                trailingText: theme.focusBorder.displayName,
                action: { settingsRouter.navigate(to: .customizationFocusBorder) }
            )
            .focused($focusedRoute, equals: .customizationFocusBorder)

            SettingsListButton(
                icon: "clock",
                heading: Strings.settingsCustomizationScreenClock,
                caption: Strings.settingsCustomizationScreenClockCaption,
                trailingText: prefs[UserPreferences.clockBehavior].displayName,
                action: { settingsRouter.navigate(to: .customizationClock) }
            )
            .focused($focusedRoute, equals: .customizationClock)

            SettingsListButton(
                icon: "checkmark.circle",
                heading: Strings.settingsCustomizationScreenWatchedIndicator,
                caption: Strings.settingsCustomizationScreenWatchedIndicatorCaption,
                trailingText: prefs[UserPreferences.watchedIndicator].displayName,
                action: { settingsRouter.navigate(to: .customizationWatchedIndicator) }
            )
            .focused($focusedRoute, equals: .customizationWatchedIndicator)

            SettingsListButton(
                icon: "captions.bubble",
                heading: Strings.subtitlesSettings,
                caption: Strings.settingsCustomizationScreenSubtitlesCaption,
                action: { settingsRouter.navigate(to: .customizationSubtitles) }
            )
            .focused($focusedRoute, equals: .customizationSubtitles)

            SettingsListButton(
                icon: "books.vertical",
                heading: Strings.librariesSettings,
                caption: Strings.settingsCustomizationScreenLibrariesCaption,
                action: { settingsRouter.navigate(to: .libraries) }
            )
            .focused($focusedRoute, equals: .libraries)
        }
        .restoresFocus($focusedRoute)
    }
}
