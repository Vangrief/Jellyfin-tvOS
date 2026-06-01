import SwiftUI

struct SettingsGeneralStyleScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsGeneralStyleScreenTitle) {
            SettingsListButton(
                icon: "paintpalette",
                heading: Strings.settingsGeneralStyleScreenAppearanceTheme,
                caption: Strings.settingsGeneralStyleScreenAppearanceThemeCaption,
                action: { settingsRouter.navigate(to: .customizationAppearanceTheme) }
            )
            .focused($focusedRoute, equals: .customizationAppearanceTheme)

            SettingsListButton(
                icon: "square.and.arrow.down",
                heading: Strings.settingsGeneralStyleScreenSavedThemes,
                caption: Strings.settingsGeneralStyleScreenSavedThemesCaption,
                action: { settingsRouter.navigate(to: .customizationSavedThemes) }
            )
            .focused($focusedRoute, equals: .customizationSavedThemes)

            SettingsListButton(
                icon: "circle.lefthalf.filled",
                heading: Strings.settingsGeneralStyleScreenFocusBorderColor,
                caption: Strings.settingsGeneralStyleScreenFocusBorderColorCaption,
                action: { settingsRouter.navigate(to: .customizationFocusBorder) }
            )
            .focused($focusedRoute, equals: .customizationFocusBorder)

            SettingsListButton(
                icon: "clock",
                heading: Strings.settingsGeneralStyleScreenClockDisplay,
                caption: Strings.settingsGeneralStyleScreenClockDisplayCaption,
                action: { settingsRouter.navigate(to: .customizationClock) }
            )
            .focused($focusedRoute, equals: .customizationClock)

            SettingsToggleButton(
                icon: "calendar.badge.clock",
                heading: Strings.settingsGeneralStyleScreen24HourClock,
                caption: Strings.settingsGeneralStyleScreen24HourClockCaption,
                isOn: prefs.binding(for: UserPreferences.use24HourClock)
            )

            SettingsToggleButton(
                icon: "viewfinder.circle",
                heading: Strings.settingsGeneralStyleScreenFocusExpansion,
                caption: Strings.settingsGeneralStyleScreenFocusExpansionCaption,
                isOn: prefs.binding(for: UserPreferences.cardFocusExpansion)
            )

            SettingsToggleButton(
                icon: "photo.artframe",
                heading: Strings.settingsGeneralStyleScreenBackgroundBackdrops,
                caption: Strings.settingsGeneralStyleScreenBackgroundBackdropsCaption,
                isOn: prefs.binding(for: UserPreferences.backdropEnabled)
            )

            SettingsListButton(
                icon: "aqi.low",
                heading: Strings.settingsGeneralStyleScreenBrowsingBlur,
                caption: Strings.settingsGeneralStyleScreenBrowsingBlurCaption,
                action: { settingsRouter.navigate(to: .moonfinBrowsingBlur) }
            )
            .focused($focusedRoute, equals: .moonfinBrowsingBlur)

            SettingsListButton(
                icon: "aqi.medium",
                heading: Strings.settingsGeneralStyleScreenDetailsBlur,
                caption: Strings.settingsGeneralStyleScreenDetailsBlurCaption,
                action: { settingsRouter.navigate(to: .moonfinDetailsBlur) }
            )
            .focused($focusedRoute, equals: .moonfinDetailsBlur)

            SettingsListButton(
                icon: "checkmark.circle",
                heading: Strings.settingsGeneralStyleScreenWatchedIndicators,
                caption: Strings.settingsGeneralStyleScreenWatchedIndicatorsCaption,
                action: { settingsRouter.navigate(to: .customizationWatchedIndicator) }
            )
            .focused($focusedRoute, equals: .customizationWatchedIndicator)


            SettingsToggleButton(
                icon: "music.note",
                heading: Strings.settingsGeneralStyleScreenThemeMusic,
                caption: Strings.settingsGeneralStyleScreenThemeMusicCaption,
                isOn: prefs.binding(for: UserPreferences.themeMusicEnabled)
            )

            SettingsListButton(
                icon: "speaker.wave.2",
                heading: Strings.settingsGeneralStyleScreenThemeMusicVolume,
                caption: Strings.settingsGeneralStyleScreenThemeMusicVolumeCaption,
                action: { settingsRouter.navigate(to: .moonfinThemeMusicVolume) }
            )
            .focused($focusedRoute, equals: .moonfinThemeMusicVolume)
        }
        .restoresFocus($focusedRoute)
    }
}
