import SwiftUI

struct SettingsOverlayView: View {
    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var settingsRouter: SettingsRouter
    @EnvironmentObject var container: AppContainer
    @Environment(\.resetFocus) private var resetFocus
    let focusNamespace: Namespace.ID
    @State private var focusTask: Task<Void, Never>?

    private var currentRoute: SettingsRoute {
        settingsRouter.path.last ?? .main
    }

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                Color.clear

                settingsPanel(width: min(max(geo.size.width * 0.40, 600), 980))
            }
        }
        .onAppear {
            scheduleFocusReset()
        }
        .onChange(of: settingsRouter.path.last ?? .main) { _ in
            scheduleFocusReset()
        }
        .onDisappear {
            focusTask?.cancel()
            focusTask = nil
        }
    }

    private func scheduleFocusReset(delay: UInt64 = 50_000_000) {
        focusTask?.cancel()
        focusTask = Task {
            try? await Task.sleep(nanoseconds: delay)
            guard !Task.isCancelled else { return }
            resetFocus(in: focusNamespace)
        }
    }

    private func settingsPanel(width: CGFloat) -> some View {
        ZStack {
            SettingsRouteResolver(route: currentRoute)
                .id(currentRoute)
                .transition(screenTransition)
                .prefersDefaultFocus(in: focusNamespace)
        }
        .frame(width: width)
        .clipped()
        .background(
            RoundedRectangle(cornerRadius: RadiusTokens.large, style: .continuous)
                .fill(theme.colorScheme.surface)
        )
        .animation(.easeInOut(duration: 0.3), value: settingsRouter.path)
        .focusSection()
        .focusScope(focusNamespace)
        .onExitCommand {
            settingsRouter.goBack()
        }
    }

    private var screenTransition: AnyTransition {
        switch settingsRouter.navigationDirection {
        case .forward:
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        case .backward:
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        }
    }
}

private struct SettingsRouteResolver: View {
    let route: SettingsRoute

    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var container: AppContainer

    var body: some View {
        screenView
    }

    @ViewBuilder
    private var screenView: some View {
        switch route {
        case .main:
            SettingsMainScreen()
        case .accountAndSecurity:
            SettingsAccountSecurityScreen()
        case .personalization:
            SettingsPersonalizationScreen()
        case .personalizationGeneralStyle:
            SettingsGeneralStyleScreen()
        case .personalizationNavigation:
            SettingsNavigationScreen()
        case .dynamicContent:
            SettingsDynamicContentScreen()
        case .dynamicContentMediaBar:
            SettingsPluginMediaBarScreen()
        case .dynamicContentLocalPreviews:
            SettingsDynamicLocalPreviewsScreen()
        case .dynamicContentSeasonalEffects:
            SettingsDynamicSeasonalEffectsScreen()
        case .dynamicContentMediaBarSourceLibraries:
            SettingsMediaBarLibrariesSelectionScreen()
        case .dynamicContentMediaBarSourceCollections:
            SettingsMediaBarCollectionsSelectionScreen()
        case .dynamicContentMediaBarExcludedGenres:
            SettingsMediaBarExcludedGenresSelectionScreen()
        case .playbackAndSyncPlay:
            SettingsPlaybackSyncPlayRootScreen()
        case .playbackSubtitles:
            SettingsSubtitlesScreen()
        case .playbackVideoPreferences:
            SettingsPlaybackScreen()
        case .playbackAudioPreferences:
            SettingsAudioPreferencesScreen()
        case .playbackAutomationQueue:
            SettingsAutomationQueueScreen()
        case .integrations:
            SettingsIntegrationsScreen()
        case .integrationsHomeScreenSections:
            SettingsHomeScreenSectionsIntegrationScreen()
        case .integrationsMetadataRatings:
            SettingsMetadataRatingsScreen()
        case .integrationsRatingSources:
            SettingsRatingSourcesScreen()
        case .placeholder(let title):
            SettingsPlaceholderScreen(title: title)
        case .authentication:
            SettingsAuthenticationScreen()
        case .authenticationSortBy:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewSortServersBy,
                selection: Binding(
                    get: { container.authPreferences.sortBy },
                    set: { container.authPreferences.sortBy = $0 }
                ),
                displayName: \.displayName
            )
        case .authenticationAutoSignIn:
            SettingsAuthenticationAutoSignInScreen()
        case .authenticationPinCode:
            SettingsAuthPinCodeScreen()
        case .authenticationServer(let serverId):
            SettingsAuthServerScreen(serverId: serverId)
        case .authenticationServerUser(let serverId, let userId):
            SettingsAuthServerUserScreen(serverId: serverId, userId: userId)
        case .customization:
            SettingsCustomizationScreen()
        case .customizationAppearanceTheme:
            SettingsAppearanceThemeScreen()
        case .customizationSavedThemes:
            SettingsAppearanceSavedThemesScreen()
        case .customizationFocusBorder:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewFocusBorderColor,
                selection: Binding(
                    get: { theme.focusBorder },
                    set: { theme.focusBorder = $0 }
                ),
                displayName: \.displayName
            )
        case .customizationClock:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewClock,
                selection: container.userPreferences.binding(for: UserPreferences.clockBehavior),
                displayName: \.displayName
            )
        case .customizationWatchedIndicator:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewWatchedIndicator,
                selection: container.userPreferences.binding(for: UserPreferences.watchedIndicator),
                displayName: \.displayName
            )
        case .customizationSubtitles:
            SettingsSubtitleCustomizationScreen()
        case .customizationDefaultSubtitleLanguage:
            SettingsDefaultSubtitleLanguageScreen()
        case .customizationSubtitlesTextColor:
            SettingsSubtitleColorPickerScreen(
                title: Strings.settingsOverlayViewTextColor,
                preference: UserPreferences.subtitlesTextColor
            )
        case .customizationSubtitlesBackgroundColor:
            SettingsSubtitleColorPickerScreen(
                title: Strings.settingsOverlayViewBackgroundColor,
                preference: UserPreferences.subtitlesBackgroundColor
            )
        case .customizationSubtitlesEdgeColor:
            SettingsSubtitleColorPickerScreen(
                title: Strings.settingsOverlayViewEdgeColor,
                preference: UserPreferences.subtitlesStrokeColor
            )
        case .customizationSubtitlesTextSize:
            SettingsSubtitleTextSizeScreen()
        case .customizationSubtitlesOffset:
            SettingsSubtitleOffsetScreen()
        case .customizationScreensaver:
            SettingsScreensaverScreen()
        case .customizationScreensaverMode:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewScreensaverMode,
                selection: container.userPreferences.binding(for: UserPreferences.screensaverMode),
                displayName: \.displayName
            )
        case .customizationScreensaverTimeout:
            SettingsScreensaverTimeoutScreen()
        case .customizationScreensaverDimming:
            SettingsScreensaverDimmingScreen()
        case .customizationScreensaverAgeRating:
            SettingsScreensaverAgeRatingScreen()
        case .home:
            SettingsHomeScreen()
        case .homeSections:
            SettingsHomeSectionsScreen()
        case .homePosterSize:
            SettingsPickerScreen(
                title: Strings.settingsPosterSize,
                selection: container.userPreferences.binding(for: UserPreferences.homePosterSize),
                displayName: \.displayName
            )
        case .homeRowsStyle:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewHomeRowStyle,
                selection: container.userPreferences.binding(for: UserPreferences.homeRowsStyle),
                displayName: \.displayName
            )
        case .homeFavoritesSortBy:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewFavoritesRowSorting,
                selection: container.userPreferences.binding(for: UserPreferences.favoritesRowSortBy),
                displayName: \.displayName
            )
        case .homeCollectionsSortBy:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewCollectionsRowSorting,
                selection: container.userPreferences.binding(for: UserPreferences.collectionsRowSortBy),
                displayName: \.displayName
            )
        case .homeGenresSortBy:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewGenresRowSorting,
                selection: container.userPreferences.binding(for: UserPreferences.genresRowSortBy),
                displayName: \.displayName
            )
        case .homeGenresItems:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewGenresRowItems,
                selection: container.userPreferences.binding(for: UserPreferences.genresRowItems),
                displayName: \.displayName
            )
        case .homeRowsImageType:
            SettingsHomeImageTypeScreen()
        case .homeImageTypeContinueWatching:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewContinueWatching,
                selection: container.userPreferences.binding(for: UserPreferences.homeImageTypeContinueWatching),
                displayName: \.displayName,
                options: ImageDisplayType.homeRowOptions
            )
        case .homeImageTypeNextUp:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewNextUp,
                selection: container.userPreferences.binding(for: UserPreferences.homeImageTypeNextUp),
                displayName: \.displayName,
                options: ImageDisplayType.homeRowOptions
            )
        case .homeImageTypeMyMedia:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewMyMedia,
                selection: container.userPreferences.binding(for: UserPreferences.homeImageTypeMyMedia),
                displayName: \.displayName,
                options: ImageDisplayType.homeRowOptions
            )
        case .homeImageTypeLibraries:
            SettingsPickerScreen(
                title: Strings.libraries,
                selection: container.userPreferences.binding(for: UserPreferences.homeImageTypeLibraries),
                displayName: \.displayName,
                options: ImageDisplayType.homeRowOptions
            )
        case .homeImageTypeLiveTv:
            SettingsPickerScreen(
                title: Strings.liveTv,
                selection: container.userPreferences.binding(for: UserPreferences.homeImageTypeLiveTv),
                displayName: \.displayName,
                options: ImageDisplayType.homeRowOptions
            )
        case .libraries:
            SettingsLibrariesScreen()
        case .librariesVisibility:
            SettingsLibraryVisibilityScreen()
        case .librariesDisplay(let itemId, let displayPreferencesId, let serverId, let userId):
            SettingsLibraryDisplayScreen(
                itemId: itemId,
                displayPreferencesId: displayPreferencesId,
                serverId: serverId,
                userId: userId
            )
        case .librariesDisplayImageSize(let itemId, _, _, _):
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewImageSize,
                selection: libraryBinding(itemId: itemId, keyPath: \.posterSize),
                displayName: \.displayName
            )
        case .librariesDisplayImageType(let itemId, _, _, _):
            SettingsPickerScreen(
                title: Strings.settingsImageType,
                selection: libraryBinding(itemId: itemId, keyPath: \.imageType),
                displayName: \.displayName
            )
        case .librariesDisplayGrid(let itemId, _, _, _):
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewGridDirection,
                selection: libraryBinding(itemId: itemId, keyPath: \.gridDirection),
                displayName: \.displayName
            )
        case .plugin:
            SettingsMoonfinScreen()
        case .pluginCustomizationProfile:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewCustomizationProfile,
                selection: container.userPreferences.binding(for: UserPreferences.pluginCustomizationProfile),
                displayName: \.displayName
            )
        case .moonfinNavbarPosition:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewNavbarPosition,
                selection: container.userPreferences.binding(for: UserPreferences.navbarPosition),
                displayName: \.displayName
            )
        case .moonfinNavbarColor:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewNavbarColor,
                selection: container.userPreferences.binding(for: UserPreferences.navbarColor),
                displayName: \.displayName
            )
        case .moonfinNavbarOpacity:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewNavbarOpacity,
                preference: UserPreferences.navbarOpacity,
                options: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                suffix: "%"
            )
        case .moonfinShuffleContentType:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewShuffleContentType,
                selection: container.userPreferences.binding(for: UserPreferences.shuffleContentType),
                displayName: \.displayName
            )
        case .moonfinMediaBarContentType:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewMediaBarContent,
                selection: container.userPreferences.binding(for: UserPreferences.mediaBarContentType),
                displayName: \.displayName
            )
        case .moonfinMediaBarItemCount:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewMediaBarItems,
                selection: container.userPreferences.binding(for: UserPreferences.mediaBarItemCount),
                displayName: \.displayName
            )
        case .moonfinMediaBarMode:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewMediaBarMode,
                selection: container.userPreferences.binding(for: UserPreferences.mediaBarMode),
                displayName: \.displayName
            )
        case .moonfinMediaBarInterval:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewMediaBarAutoAdvanceInterval,
                preference: UserPreferences.mediaBarIntervalMs,
                options: [5000, 10_000, 15_000, 30_000],
                suffix: " ms"
            )
        case .moonfinMediaBarColor:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewMediaBarColor,
                selection: container.userPreferences.binding(for: UserPreferences.mediaBarOverlayColor),
                displayName: \.displayName
            )
        case .moonfinMediaBarOpacity:
            SettingsMediaBarOpacityScreen()
        case .moonfinThemeMusicVolume:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewThemeMusicVolume,
                preference: UserPreferences.themeMusicVolume,
                options: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                suffix: "%"
            )
        case .moonfinDetailsBlur:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewDetailsBackgroundBlur,
                preference: UserPreferences.detailsBackgroundBlur,
                options: [0, 5, 10, 15, 20, 25, 30, 35, 40],
                suffix: ""
            )
        case .moonfinBrowsingBlur:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewBrowsingBackgroundBlur,
                preference: UserPreferences.browsingBackgroundBlur,
                options: [0, 5, 10, 15, 20, 25, 30, 35, 40],
                suffix: ""
            )
        case .moonfinSeasonalSurprise:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewSeasonalSurprise,
                selection: container.userPreferences.binding(for: UserPreferences.seasonalSurprise),
                displayName: \.displayName
            )
        case .playback:
            SettingsPlaybackScreen()
        case .playbackMediaSegments:
            SettingsMediaSegmentsScreen()
        case .playbackMediaSegment(let segmentType):
            if let type = MediaSegmentType(rawValue: segmentType) {
                SettingsMediaSegmentScreen(segmentType: type)
            } else {
                SettingsPlaceholderScreen(title: "Playback Segment")
            }
        case .playbackNextUpBehavior:
            SettingsPickerScreen(
                title: Strings.nextUpBehaviorTitle,
                selection: container.userPreferences.binding(for: UserPreferences.nextUpBehavior),
                displayName: \.displayName
            )
        case .playbackNextUpTimeout:
            SettingsSyncPlayValueScreen(
                title: Strings.nextUpTimeoutTitle,
                preference: UserPreferences.nextUpTimeout,
                options: [0, 5, 10, 15, 20, 25, 30, 45, 60],
                suffix: Strings.secondsShort
            )
        case .playbackInactivityPrompt:
            StillWatchingSettingsScreen()
        case .playbackMaxBitrate:
            SettingsMaxBitrateScreen()
        case .playbackAudioBehavior:
            SettingsPickerScreen(
                title: Strings.audioBehavior,
                selection: container.userPreferences.binding(for: UserPreferences.audioBehavior),
                displayName: \.displayName
            )
        case .playbackAudioOutput:
            SettingsPickerScreen(
                title: Strings.audioOutput,
                selection: container.userPreferences.binding(for: UserPreferences.audioOutput),
                displayName: \.displayName
            )
        case .playbackSlideshowInterval:
            SettingsPickerScreen(
                title: Strings.slideshowInterval,
                selection: container.userPreferences.binding(for: UserPreferences.photoSlideshowInterval),
                displayName: \.displayName
            )
        case .playbackAdvanced:
            SettingsPlaybackAdvancedScreen()
        case .playbackResumeSubtractDuration:
            SettingsSyncPlayValueScreen(
                title: Strings.resumePreroll,
                preference: UserPreferences.resumeSubtractDuration,
                options: [0, 3, 5, 7, 10, 20, 30, 60, 120, 300],
                suffix: Strings.secondsShort
            )
        case .playbackSkipForwardLength:
            SettingsSyncPlayValueScreen(
                title: Strings.skipForwardLength,
                preference: UserPreferences.skipForwardLength,
                options: [5, 10, 15, 20, 25, 30],
                suffix: Strings.secondsShort
            )
        case .playbackUnpauseRewind:
            SettingsSyncPlayValueScreen(
                title: Strings.unpauseRewind,
                preference: UserPreferences.unpauseRewindDuration,
                options: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                suffix: Strings.secondsShort
            )
        case .playbackVideoStartDelay:
            SettingsSyncPlayValueScreen(
                title: Strings.videoStartDelay,
                preference: UserPreferences.videoStartDelay,
                options: [0, 250, 500, 1000, 2000, 3000, 5000],
                suffix: Strings.millisecondsShort
            )
        case .playbackMaxResolution:
            SettingsPickerScreen(
                title: Strings.maxResolution,
                selection: container.userPreferences.binding(for: UserPreferences.maxVideoResolution),
                displayName: \.displayName
            )
        case .playbackRefreshRateSwitching:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewRefreshRateSwitching,
                selection: container.userPreferences.binding(for: UserPreferences.refreshRateSwitchingBehavior),
                displayName: \.displayName
            )
        case .playbackSkipBackLength:
            SettingsSyncPlayValueScreen(
                title: Strings.settingsOverlayViewSkipBackLength,
                preference: UserPreferences.skipBackLength,
                options: [5, 10, 15, 20, 25, 30],
                suffix: Strings.secondsShort
            )
        case .playbackDefaultAudioLanguage:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewDefaultAudioLanguage,
                selection: container.userPreferences.binding(for: UserPreferences.defaultAudioLanguage),
                displayName: \.displayName
            )
        case .playbackQualityProfile:
            SettingsPickerScreen(
                title: Strings.settingsOverlayViewPlaybackQuality,
                selection: container.userPreferences.binding(for: UserPreferences.playbackQualityProfile),
                displayName: playbackQualityOptionLabel
            )
        case .playbackZoomMode:
            SettingsPickerScreen(
                title: Strings.defaultZoom,
                selection: container.userPreferences.binding(for: UserPreferences.playerZoomMode),
                displayName: \.displayName
            )
        case .language:
            SettingsLanguageScreen()
        case .telemetry:
            SettingsTelemetryScreen()
        case .about:
            SettingsAboutScreen()
        case .licenses:
            SettingsLicensesScreen()
        case .license(let artifactId):
            SettingsLicenseDetailScreen(artifactId: artifactId)
        case .syncPlay:
            SyncPlayScreen()
        case .seerr:
            SettingsSeerrScreen()
        case .seerrRows:
            SettingsSeerrRowsScreen()
        case .seerrFetchLimit:
            SettingsPickerScreen(
                title: Strings.fetchLimit,
                selection: seerrFetchLimitBinding,
                displayName: \.displayName
            )
        case .moonfinParentalControls:
            SettingsParentalControlsScreen()
        case .moonfinSyncPlay:
            SettingsSyncPlayScreen()
        case .moonfinSyncPlayMinDelay:
            SettingsSyncPlayValueScreen(
                title: Strings.syncPlayMinDelaySpeed,
                preference: UserPreferences.syncPlayMinDelaySpeedToSync,
                options: [50, 100, 150, 200, 300, 500, 750, 1000],
                suffix: Strings.millisecondsShort
            )
        case .moonfinSyncPlayMaxDelay:
            SettingsSyncPlayValueScreen(
                title: Strings.syncPlayMaxDelaySpeed,
                preference: UserPreferences.syncPlayMaxDelaySpeedToSync,
                options: [1000, 2000, 3000, 5000, 7500, 10000],
                suffix: Strings.millisecondsShort
            )
        case .moonfinSyncPlayDuration:
            SettingsSyncPlayValueScreen(
                title: Strings.syncPlaySpeedDuration,
                preference: UserPreferences.syncPlaySpeedToSyncDuration,
                options: [500, 750, 1000, 1500, 2000, 3000],
                suffix: Strings.millisecondsShort
            )
        case .moonfinSyncPlayMinDelaySkip:
            SettingsSyncPlayValueScreen(
                title: Strings.syncPlayMinDelaySkip,
                preference: UserPreferences.syncPlayMinDelaySkipToSync,
                options: [500, 1000, 1500, 2000, 3000, 5000],
                suffix: Strings.millisecondsShort
            )
        case .moonfinSyncPlayExtraOffset:
            SettingsSyncPlayValueScreen(
                title: Strings.syncPlayExtraOffset,
                preference: UserPreferences.syncPlayExtraTimeOffset,
                options: [-5000, -2000, -1000, -500, 0, 500, 1000, 2000, 5000],
                suffix: Strings.millisecondsShort
            )
        case .liveTvGuideOptions:
            SettingsLiveTvGuideOptionsScreen()
        case .liveTvGuideFilters:
            SettingsLiveTvGuideFiltersScreen()
        case .liveTvGuideChannelOrder:
            SettingsPickerScreen(
                title: Strings.channelOrder,
                selection: container.userPreferences.binding(for: UserPreferences.liveTvChannelOrder),
                displayName: \.displayName
            )
        default:
            SettingsPlaceholderScreen()
        }
    }

    private var seerrFetchLimitBinding: Binding<SeerrFetchLimit> {
        let prefs = container.seerrRepository.getPreferences()
        return Binding(
            get: { prefs?[SeerrPreferences.fetchLimit] ?? .medium },
            set: { prefs?[SeerrPreferences.fetchLimit] = $0 }
        )
    }

    private func libraryBinding<T>(itemId: String, keyPath: ReferenceWritableKeyPath<LibraryPreferences, T>) -> Binding<T> {
        let prefs = LibraryPreferences(store: container.preferenceStore, libraryId: itemId)
        return Binding(
            get: { prefs[keyPath: keyPath] },
            set: { prefs[keyPath: keyPath] = $0 }
        )
    }

    private func playbackQualityOptionLabel(_ option: PlaybackQualityProfile) -> String {
        let generation = VideoCapabilityDetector.current().generation
        return option.pickerDisplayName(for: generation)
    }
}

struct SettingsPlaceholderScreen: View {
    @EnvironmentObject var theme: MoonfinTheme
    var title: String? = nil

    var body: some View {
        VStack {
            Spacer()
            if let title {
                Text(title)
                    .font(.bodyLg)
                    .foregroundColor(theme.colorScheme.onBackground)
                    .padding(.bottom, SpaceTokens.spaceXs)
            }
            Text(Strings.comingSoon)
                .font(.bodyMd)
                .foregroundColor(theme.colorScheme.listCaption)
            Spacer()
        }
    }
}
