import SwiftUI

struct SettingsPlaybackAdvancedScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @EnvironmentObject var theme: MoonfinTheme
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    private var videoStartDelayLabel: String {
        let val = prefs[UserPreferences.videoStartDelay]
        return val == 0 ? Strings.none : Strings.settingsPlaybackAdvancedScreenMilliseconds(val)
    }

    private var playbackQualityProfileLabel: String {
        let selected = prefs[UserPreferences.playbackQualityProfile]
        if selected != .auto {
            return selected.displayName
        }

        let generation = VideoCapabilityDetector.current().generation
        return PlaybackQualityProfile.autoSummaryDisplayName(for: generation)
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsPlaybackAdvancedScreenAdvancedPlayback) {
            SettingsListButton(
                icon: "gauge.with.dots.needle.50percent",
                heading: Strings.settingsPlaybackAdvancedScreenPlaybackQuality,
                caption: Strings.settingsPlaybackAdvancedScreenCompatibilityProfile,
                trailingText: playbackQualityProfileLabel,
                action: { settingsRouter.navigate(to: .playbackQualityProfile) }
            )
            .focused($focusedRoute, equals: .playbackQualityProfile)

            SettingsListButton(
                icon: "clock.badge.questionmark",
                heading: Strings.settingsPlaybackAdvancedScreenVideoStartDelay,
                caption: Strings.settingsPlaybackAdvancedScreenDelayBeforePlayback,
                trailingText: videoStartDelayLabel,
                action: { settingsRouter.navigate(to: .playbackVideoStartDelay) }
            )
            .focused($focusedRoute, equals: .playbackVideoStartDelay)

            sectionDivider()
            sectionHeader(Strings.playerAudioSection)
            Text(Strings.settingsPlaybackAdvancedScreenAudioControlsHint)
                .font(.caption)
                .foregroundColor(theme.colorScheme.listCaption)

            sectionDivider()
            sectionHeader(Strings.liveTv)

            SettingsToggleButton(
                icon: "play.tv",
                heading: Strings.settingsPlaybackAdvancedScreenDirectPlay,
                caption: Strings.settingsPlaybackAdvancedScreenPlayLiveStreams,
                isOn: prefs.binding(for: UserPreferences.liveTvDirectPlay)
            )
        }
        .restoresFocus($focusedRoute)
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.bodyLg)
            .fontWeight(.semibold)
            .foregroundColor(theme.colorScheme.onBackground)
            .padding(.bottom, SpaceTokens.space2xs)
    }

    private func sectionDivider() -> some View {
        Divider()
            .background(theme.colorScheme.listCaption.opacity(0.3))
            .padding(.vertical, SpaceTokens.spaceXs)
    }
}
