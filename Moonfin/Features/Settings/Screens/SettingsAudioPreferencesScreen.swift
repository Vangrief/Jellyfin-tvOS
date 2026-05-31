import SwiftUI

struct SettingsAudioPreferencesScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsAudioPreferencesScreenTitle) {
            SettingsToggleButton(
                icon: "moon.fill",
                heading: Strings.settingsAudioPreferencesScreenNightMode,
                caption: Strings.settingsAudioPreferencesScreenNightModeCaption,
                isOn: prefs.binding(for: UserPreferences.audioNightMode)
            )

            SettingsListButton(
                icon: "globe",
                heading: Strings.settingsAudioPreferencesScreenDefaultAudioLanguage,
                caption: Strings.settingsAudioPreferencesScreenDefaultAudioLanguageCaption,
                trailingText: prefs[UserPreferences.defaultAudioLanguage].displayName,
                action: { settingsRouter.navigate(to: .playbackDefaultAudioLanguage) }
            )
            .focused($focusedRoute, equals: .playbackDefaultAudioLanguage)

            SettingsListButton(
                icon: "speaker.wave.2",
                heading: Strings.settingsAudioPreferencesScreenAudioBehavior,
                caption: Strings.settingsAudioPreferencesScreenAudioBehaviorCaption,
                trailingText: prefs[UserPreferences.audioBehavior].displayName,
                action: { settingsRouter.navigate(to: .playbackAudioBehavior) }
            )
            .focused($focusedRoute, equals: .playbackAudioBehavior)

            SettingsListButton(
                icon: "airplayaudio",
                heading: Strings.settingsAudioPreferencesScreenAudioOutput,
                caption: Strings.settingsAudioPreferencesScreenAudioOutputCaption,
                trailingText: prefs[UserPreferences.audioOutput].displayName,
                action: { settingsRouter.navigate(to: .playbackAudioOutput) }
            )
            .focused($focusedRoute, equals: .playbackAudioOutput)

            SettingsToggleButton(
                icon: "speaker",
                heading: Strings.settingsAudioPreferencesScreenAc3Passthrough,
                caption: Strings.settingsAudioPreferencesScreenAc3PassthroughCaption,
                isOn: prefs.binding(for: UserPreferences.ac3Enabled)
            )

            SettingsToggleButton(
                icon: "waveform.path.ecg",
                heading: Strings.settingsAudioPreferencesScreenTrueHdSupport,
                caption: Strings.settingsAudioPreferencesScreenTrueHdSupportCaption,
                isOn: prefs.binding(for: UserPreferences.trueHdEnabled)
            )
        }
        .restoresFocus($focusedRoute)
    }
}
