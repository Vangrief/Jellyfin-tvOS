import SwiftUI

struct SettingsPluginMediaBarScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    private var isMediaBarDisabled: Bool {
        prefs[UserPreferences.mediaBarMode] == .off
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.mediaBarTitle) {
            SettingsListButton(
                icon: "switch.2",
                heading: Strings.settingsPluginMediaBarScreenMediaBarStyle,
                caption: Strings.settingsPluginMediaBarScreenMediaBarStyleCaption,
                trailingText: prefs[UserPreferences.mediaBarMode].displayName,
                action: { settingsRouter.navigate(to: .moonfinMediaBarMode) }
            )
            .focused($focusedRoute, equals: .moonfinMediaBarMode)

            if !isMediaBarDisabled {
            SettingsListButton(
                icon: "film.stack",
                heading: Strings.settingsPluginMediaBarScreenContentType,
                caption: Strings.settingsPluginMediaBarScreenContentTypeCaption,
                trailingText: prefs[UserPreferences.mediaBarContentType] == .both ? Strings.settingsPluginMediaBarScreenMoviesAndTvShows : prefs[UserPreferences.mediaBarContentType].displayName,
                action: { settingsRouter.navigate(to: .moonfinMediaBarContentType) }
            )
            .focused($focusedRoute, equals: .moonfinMediaBarContentType)

            SettingsListButton(
                icon: "number",
                heading: Strings.settingsPluginMediaBarScreenItemCount,
                caption: Strings.settingsPluginMediaBarScreenItemCountCaption,
                trailingText: prefs[UserPreferences.mediaBarItemCount].displayName,
                action: { settingsRouter.navigate(to: .moonfinMediaBarItemCount) }
            )
            .focused($focusedRoute, equals: .moonfinMediaBarItemCount)

            SettingsListButton(
                icon: "film",
                heading: Strings.settingsPluginMediaBarScreenSourceLibraries,
                caption: Strings.settingsPluginMediaBarScreenSourceLibrariesCaption,
                trailingText: selectedCountLabel(prefs[UserPreferences.mediaBarLibraryIds]),
                action: { settingsRouter.navigate(to: .dynamicContentMediaBarSourceLibraries) }
            )
            .focused($focusedRoute, equals: .dynamicContentMediaBarSourceLibraries)

            SettingsListButton(
                icon: "square.stack.3d.up",
                heading: Strings.settingsPluginMediaBarScreenSourceCollections,
                caption: Strings.settingsPluginMediaBarScreenSourceCollectionsCaption,
                trailingText: selectedCountLabel(prefs[UserPreferences.mediaBarCollectionIds]),
                action: { settingsRouter.navigate(to: .dynamicContentMediaBarSourceCollections) }
            )
            .focused($focusedRoute, equals: .dynamicContentMediaBarSourceCollections)

            SettingsListButton(
                icon: "tag.slash",
                heading: Strings.settingsPluginMediaBarScreenExcludedGenres,
                caption: Strings.settingsPluginMediaBarScreenExcludedGenresCaption,
                trailingText: selectedCountLabel(prefs[UserPreferences.mediaBarExcludedGenres]),
                action: { settingsRouter.navigate(to: .dynamicContentMediaBarExcludedGenres) }
            )
            .focused($focusedRoute, equals: .dynamicContentMediaBarExcludedGenres)

            SettingsToggleButton(
                icon: "play.fill",
                heading: Strings.settingsPluginMediaBarScreenAutoAdvance,
                caption: Strings.settingsPluginMediaBarScreenAutoAdvanceCaption,
                isOn: prefs.binding(for: UserPreferences.mediaBarAutoAdvance)
            )

            if prefs[UserPreferences.mediaBarAutoAdvance] {
                SettingsListButton(
                    icon: "timer",
                    heading: Strings.settingsPluginMediaBarScreenAutoAdvanceInterval,
                    caption: Strings.settingsPluginMediaBarScreenAutoAdvanceIntervalCaption,
                    trailingText: Strings.settingsPluginMediaBarScreenMilliseconds(prefs[UserPreferences.mediaBarIntervalMs]),
                    action: { settingsRouter.navigate(to: .moonfinMediaBarInterval) }
                )
                .focused($focusedRoute, equals: .moonfinMediaBarInterval)
            }

            SettingsToggleButton(
                icon: "speaker.wave.2.fill",
                heading: Strings.settingsPluginMediaBarScreenTrailerAudio,
                caption: Strings.settingsPluginMediaBarScreenTrailerAudioCaption,
                isOn: prefs.binding(for: UserPreferences.mediaBarTrailerAudio)
            )

            SettingsListButton(
                icon: "circle.lefthalf.filled.inverse",
                heading: Strings.settingsPluginMediaBarScreenMediaBarOverlay,
                caption: Strings.settingsPluginMediaBarScreenOverlayOpacity,
                trailingText: "\(prefs[UserPreferences.mediaBarOverlayOpacity])%",
                action: { settingsRouter.navigate(to: .moonfinMediaBarOpacity) }
            )
            .focused($focusedRoute, equals: .moonfinMediaBarOpacity)

            SettingsListButton(
                icon: "paintpalette",
                heading: Strings.settingsPluginMediaBarScreenMediaBarColor,
                caption: Strings.settingsPluginMediaBarScreenOverlayColor,
                trailingText: prefs[UserPreferences.mediaBarOverlayColor].displayName,
                action: { settingsRouter.navigate(to: .moonfinMediaBarColor) }
            )
            .focused($focusedRoute, equals: .moonfinMediaBarColor)
            }

        }
        .restoresFocus($focusedRoute)
    }

    private func selectedCountLabel(_ ids: [String]) -> String {
        let normalizedCount = Set(ids.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }).count
        return normalizedCount == 0 ? Strings.liveTvAll : Strings.settingsPluginMediaBarScreenSelectedCount(normalizedCount)
    }
}
