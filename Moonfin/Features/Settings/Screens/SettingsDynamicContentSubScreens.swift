import SwiftUI

struct SettingsDynamicLocalPreviewsScreen: View {
    @EnvironmentObject var container: AppContainer

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsDynamicContentSubScreensLocalPreviews) {
            SettingsToggleButton(
                icon: "play.rectangle.on.rectangle",
                heading: Strings.settingsDynamicContentSubScreensTrailerPreview,
                caption: Strings.settingsDynamicContentSubScreensTrailerPreviewCaption,
                isOn: prefs.binding(for: UserPreferences.mediaBarTrailerPreview)
            )

            SettingsToggleButton(
                icon: "tv",
                heading: Strings.settingsDynamicContentSubScreensMediaPreview,
                caption: Strings.settingsDynamicContentSubScreensMediaPreviewCaption,
                isOn: prefs.binding(for: UserPreferences.mediaPreviewEnabled)
            )

            SettingsToggleButton(
                icon: "speaker.wave.2",
                heading: Strings.settingsDynamicContentSubScreensPreviewAudio,
                caption: Strings.settingsDynamicContentSubScreensPreviewAudioCaption,
                isOn: prefs.binding(for: UserPreferences.previewAudioEnabled)
            )
        }
    }
}

struct SettingsDynamicSeasonalEffectsScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsDynamicContentSubScreensSeasonalEffects) {
            SettingsListButton(
                icon: "sparkles",
                heading: Strings.settingsDynamicContentSubScreensSeasonalSurprise,
                caption: Strings.settingsDynamicContentSubScreensSeasonalSurpriseCaption,
                trailingText: prefs[UserPreferences.seasonalSurprise].displayName,
                action: { settingsRouter.navigate(to: .moonfinSeasonalSurprise) }
            )
            .focused($focusedRoute, equals: .moonfinSeasonalSurprise)
        }
        .restoresFocus($focusedRoute)
    }
}
