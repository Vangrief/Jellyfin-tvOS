import SwiftUI

struct SettingsLiveTvGuideFiltersScreen: View {
    @EnvironmentObject var container: AppContainer

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.liveTvGuideFilters) {
            SettingsToggleButton(
                icon: "film",
                heading: Strings.movies,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowMovies,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterMovies)
            )

            SettingsToggleButton(
                icon: "tv",
                heading: Strings.series,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowSeries,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterSeries)
            )

            SettingsToggleButton(
                icon: "newspaper",
                heading: Strings.news,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowNews,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterNews)
            )

            SettingsToggleButton(
                icon: "figure.and.child.holdinghands",
                heading: Strings.kids,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowKids,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterKids)
            )

            SettingsToggleButton(
                icon: "sportscourt",
                heading: Strings.sports,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowSports,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterSports)
            )

            SettingsToggleButton(
                icon: "star.circle",
                heading: Strings.settingsLiveTvGuideFiltersScreenPremieresOnly,
                caption: Strings.settingsLiveTvGuideFiltersScreenShowPremieres,
                isOn: prefs.binding(for: UserPreferences.liveTvFilterPremiere)
            )
        }
    }
}
