import SwiftUI

struct SettingsHomeScreen: View {
    @EnvironmentObject var settingsRouter: SettingsRouter
    @EnvironmentObject var container: AppContainer
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    private var isClassicRowsStyle: Bool {
        prefs[UserPreferences.homeRowsStyle] == .v1
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsHomeScreenTitle) {
            SettingsListButton(
                icon: "rectangle.3.group",
                heading: Strings.settingsHomeScreenHomeRowStyle,
                caption: Strings.settingsHomeScreenHomeRowStyleCaption,
                trailingText: prefs[UserPreferences.homeRowsStyle].displayName,
                action: { settingsRouter.navigate(to: .homeRowsStyle) }
            )
            .focused($focusedRoute, equals: .homeRowsStyle)

            SettingsListButton(
                icon: "list.bullet",
                heading: Strings.settingsHomeScreenHomeSections,
                caption: Strings.settingsHomeScreenHomeSectionsCaption,
                action: { settingsRouter.navigate(to: .homeSections) }
            )
            .focused($focusedRoute, equals: .homeSections)

            if isClassicRowsStyle {
                SettingsListButton(
                    icon: "photo.on.rectangle",
                    heading: Strings.settingsHomeScreenPerRowImageType,
                    caption: Strings.settingsHomeScreenPerRowImageTypeCaption,
                    action: { settingsRouter.navigate(to: .homeRowsImageType) }
                )
                .focused($focusedRoute, equals: .homeRowsImageType)
            }

            SettingsToggleButton(
                icon: "arrow.left.arrow.right",
                heading: Strings.settingsHomeScreenMergeContinueNextUp,
                caption: Strings.settingsHomeScreenMergeContinueNextUpCaption,
                isOn: prefs.binding(for: UserPreferences.mergeContinueWatchingNextUp)
            )

            SettingsToggleButton(
                icon: "heart",
                heading: Strings.settingsHomeScreenDisplayFavoritesRows,
                caption: Strings.settingsHomeScreenDisplayFavoritesRowsCaption,
                isOn: prefs.binding(for: UserPreferences.displayFavoritesRows)
            )

            if prefs[UserPreferences.displayFavoritesRows] {
                SettingsListButton(
                    icon: "arrow.up.arrow.down",
                    heading: Strings.settingsHomeScreenFavoritesRowSorting,
                    caption: Strings.settingsHomeScreenFavoritesRowSortingCaption,
                    trailingText: prefs[UserPreferences.favoritesRowSortBy].displayName,
                    action: { settingsRouter.navigate(to: .homeFavoritesSortBy) }
                )
                .focused($focusedRoute, equals: .homeFavoritesSortBy)
            }

            SettingsToggleButton(
                icon: "square.stack.3d.down.right",
                heading: Strings.settingsHomeScreenDisplayCollectionsRows,
                caption: Strings.settingsHomeScreenDisplayCollectionsRowsCaption,
                isOn: prefs.binding(for: UserPreferences.displayCollectionsRows)
            )

            if prefs[UserPreferences.displayCollectionsRows] {
                SettingsListButton(
                    icon: "arrow.up.arrow.down",
                    heading: Strings.settingsHomeScreenCollectionsRowSorting,
                    caption: Strings.settingsHomeScreenCollectionsRowSortingCaption,
                    trailingText: prefs[UserPreferences.collectionsRowSortBy].displayName,
                    action: { settingsRouter.navigate(to: .homeCollectionsSortBy) }
                )
                .focused($focusedRoute, equals: .homeCollectionsSortBy)
            }

            SettingsToggleButton(
                icon: "theatermasks",
                heading: Strings.settingsHomeScreenDisplayGenresRows,
                caption: Strings.settingsHomeScreenDisplayGenresRowsCaption,
                isOn: prefs.binding(for: UserPreferences.displayGenresRows)
            )

            if prefs[UserPreferences.displayGenresRows] {
                SettingsListButton(
                    icon: "arrow.up.arrow.down",
                    heading: Strings.settingsHomeScreenGenresRowSorting,
                    caption: Strings.settingsHomeScreenGenresRowSortingCaption,
                    trailingText: prefs[UserPreferences.genresRowSortBy].displayName,
                    action: { settingsRouter.navigate(to: .homeGenresSortBy) }
                )
                .focused($focusedRoute, equals: .homeGenresSortBy)

                SettingsListButton(
                    icon: "line.3.horizontal.decrease.circle",
                    heading: Strings.settingsHomeScreenGenresRowItems,
                    caption: Strings.settingsHomeScreenGenresRowItemsCaption,
                    trailingText: prefs[UserPreferences.genresRowItems].displayName,
                    action: { settingsRouter.navigate(to: .homeGenresItems) }
                )
                .focused($focusedRoute, equals: .homeGenresItems)
            }

            if isClassicRowsStyle {
                SettingsToggleButton(
                    icon: "photo.on.rectangle.angled",
                    heading: Strings.settingsHomeScreenSeriesThumbnails,
                    caption: Strings.settingsHomeScreenSeriesThumbnailsCaption,
                    isOn: prefs.binding(for: UserPreferences.homeImageUseSeriesImage)
                )
            }

            SettingsListButton(
                icon: "rectangle.expand.vertical",
                heading: Strings.settingsHomeScreenPosterSize,
                caption: Strings.settingsHomeScreenPosterSizeCaption,
                trailingText: prefs[UserPreferences.homePosterSize].displayName,
                action: { settingsRouter.navigate(to: .homePosterSize) }
            )
            .focused($focusedRoute, equals: .homePosterSize)

            if isClassicRowsStyle {
                SettingsToggleButton(
                    icon: "info.circle",
                    heading: Strings.settingsHomeScreenInfoOverlay,
                    caption: Strings.settingsHomeScreenInfoOverlayCaption,
                    isOn: prefs.binding(for: UserPreferences.homeRowInfoOverlay)
                )
            }

            SettingsToggleButton(
                icon: "music.note.house",
                heading: Strings.settingsHomeScreenThemeMusicOnHomeRows,
                caption: Strings.settingsHomeScreenThemeMusicOnHomeRowsCaption,
                isOn: prefs.binding(for: UserPreferences.themeMusicOnHomeRows)
            )
        }
        .id(prefs[UserPreferences.homeRowsStyle])
        .restoresFocus($focusedRoute)
    }
}
