import SwiftUI

struct SettingsPlaybackSyncPlayRootScreen: View {
    @EnvironmentObject var container: AppContainer
    @FocusState private var focusedRoute: SettingsRoute?

    private var supportsSyncPlay: Bool {
        container.serverRepository.currentServer.value?.serverType.supports(.syncPlay) == true
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsPlaybackSyncPlayRootScreenTitle) {
            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .playbackVideoPreferences,
                icon: "play.circle",
                heading: Strings.settingsPlaybackSyncPlayRootScreenVideoHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenVideoCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .playbackAudioPreferences,
                icon: "speaker.wave.2",
                heading: Strings.settingsPlaybackSyncPlayRootScreenAudioHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenAudioCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .playbackSubtitles,
                icon: "captions.bubble",
                heading: Strings.settingsPlaybackSyncPlayRootScreenSubtitlesHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenSubtitlesCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .playbackAutomationQueue,
                icon: "list.bullet.rectangle.portrait",
                heading: Strings.settingsPlaybackSyncPlayRootScreenAutomationHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenAutomationCaption
            )

            if supportsSyncPlay {
                SettingsNavRow(
                    focusedRoute: $focusedRoute,
                    route: .moonfinSyncPlay,
                    icon: "person.3.fill",
                    heading: Strings.settingsPlaybackSyncPlayRootScreenSyncPlayHeading,
                    caption: Strings.settingsPlaybackSyncPlayRootScreenSyncPlayCaption
                )
            }

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .playbackAdvanced,
                icon: "gearshape.2",
                heading: Strings.settingsPlaybackSyncPlayRootScreenAdvancedHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenAdvancedCaption
            )

            SettingsNavRow(
                focusedRoute: $focusedRoute,
                route: .liveTvGuideOptions,
                icon: "tv",
                heading: Strings.settingsPlaybackSyncPlayRootScreenLiveTvHeading,
                caption: Strings.settingsPlaybackSyncPlayRootScreenLiveTvCaption
            )
        }
        .restoresFocus($focusedRoute)
    }
}
