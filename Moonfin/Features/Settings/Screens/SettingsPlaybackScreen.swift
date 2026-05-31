import SwiftUI

struct SettingsPlaybackScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    private var supportsMediaSegments: Bool {
        container.serverRepository.currentServer.value?.serverType.supports(.mediaSegments) == true
    }

    private var bitrateLabel: String {
        let value = prefs[UserPreferences.maxBitrate]
        if value == 0 { return Strings.optionAuto }
        if value >= 1_000_000 {
            return Strings.settingsPlaybackScreenBitrateMbps(value / 1_000_000)
        }
        return Strings.playerBitrateKbps(value / 1000)
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsPlaybackScreenVideoPlaybackPreferences) {
            if supportsMediaSegments {
                SettingsListButton(
                    icon: "scissors",
                    heading: Strings.settingsPlaybackScreenSkipIntrosAndOutros,
                    caption: Strings.settingsPlaybackScreenChooseActionBehavior,
                    action: { settingsRouter.navigate(to: .playbackMediaSegments) }
                )
                .focused($focusedRoute, equals: .playbackMediaSegments)
            } else {
                SettingsListButton(
                    icon: "scissors",
                    heading: Strings.settingsPlaybackScreenSkipIntrosAndOutros,
                    caption: Strings.settingsPlaybackScreenNotAvailableOnServer,
                    action: { }
                )
            }

            SettingsToggleButton(
                icon: "pause.circle",
                heading: Strings.settingsPlaybackScreenShowDescriptionOnPause,
                caption: Strings.settingsPlaybackScreenShowDescriptionOnPauseCaption,
                isOn: prefs.binding(for: UserPreferences.showDescriptionOnPause)
            )

            SettingsListButton(
                icon: "speedometer",
                heading: Strings.settingsPlaybackScreenMaxStreamingBitrate,
                caption: Strings.settingsPlaybackScreenMaxStreamingBitrateCaption,
                trailingText: bitrateLabel,
                action: { settingsRouter.navigate(to: .playbackMaxBitrate) }
            )
            .focused($focusedRoute, equals: .playbackMaxBitrate)

            SettingsListButton(
                icon: "rectangle.badge.checkmark",
                heading: Strings.settingsPlaybackScreenMaxResolution,
                caption: Strings.settingsPlaybackScreenMaxResolutionCaption,
                trailingText: prefs[UserPreferences.maxVideoResolution].displayName,
                action: { settingsRouter.navigate(to: .playbackMaxResolution) }
            )
            .focused($focusedRoute, equals: .playbackMaxResolution)

            SettingsListButton(
                icon: "arrow.up.left.and.arrow.down.right",
                heading: Strings.settingsPlaybackScreenPlayerZoomMode,
                caption: Strings.settingsPlaybackScreenPlayerZoomModeCaption,
                trailingText: prefs[UserPreferences.playerZoomMode].displayName,
                action: { settingsRouter.navigate(to: .playbackZoomMode) }
            )
            .focused($focusedRoute, equals: .playbackZoomMode)

            SettingsToggleButton(
                icon: "memorychip",
                heading: Strings.settingsPlaybackScreenHardwareDecoding,
                caption: Strings.settingsPlaybackScreenHardwareDecodingCaption,
                isOn: prefs.binding(for: UserPreferences.hardwareDecoding)
            )

            SettingsListButton(
                icon: "speedometer",
                heading: Strings.settingsPlaybackScreenRefreshRateSwitching,
                caption: Strings.settingsPlaybackScreenRefreshRateSwitchingCaption,
                trailingText: prefs[UserPreferences.refreshRateSwitchingBehavior].displayName,
                action: { settingsRouter.navigate(to: .playbackRefreshRateSwitching) }
            )
            .focused($focusedRoute, equals: .playbackRefreshRateSwitching)

            SettingsToggleButton(
                icon: "film.stack",
                heading: Strings.trickPlay,
                caption: Strings.trickPlayDescription,
                isOn: prefs.binding(for: UserPreferences.trickPlayEnabled)
            )

            SettingsListButton(
                icon: "gobackward",
                heading: Strings.settingsPlaybackScreenResumeRewind,
                caption: Strings.settingsPlaybackScreenResumeRewindCaption,
                action: { settingsRouter.navigate(to: .playbackResumeSubtractDuration) }
            )
            .focused($focusedRoute, equals: .playbackResumeSubtractDuration)

            SettingsListButton(
                icon: "arrow.uturn.backward",
                heading: Strings.settingsPlaybackScreenUnpauseRewind,
                caption: Strings.settingsPlaybackScreenUnpauseRewindCaption,
                action: { settingsRouter.navigate(to: .playbackUnpauseRewind) }
            )
            .focused($focusedRoute, equals: .playbackUnpauseRewind)

            SettingsListButton(
                icon: "backward.fill",
                heading: Strings.settingsPlaybackScreenSkipBackLength,
                caption: Strings.settingsPlaybackScreenSkipBackLengthCaption,
                trailingText: Strings.settingsPlaybackScreenSecondsShort(prefs[UserPreferences.skipBackLength]),
                action: { settingsRouter.navigate(to: .playbackSkipBackLength) }
            )
            .focused($focusedRoute, equals: .playbackSkipBackLength)

            SettingsListButton(
                icon: "forward.fill",
                heading: Strings.settingsPlaybackScreenSkipForwardLength,
                caption: Strings.settingsPlaybackScreenSkipForwardLengthCaption,
                action: { settingsRouter.navigate(to: .playbackSkipForwardLength) }
            )
            .focused($focusedRoute, equals: .playbackSkipForwardLength)

        }
        .restoresFocus($focusedRoute)
    }
}
