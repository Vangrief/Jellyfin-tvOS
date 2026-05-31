import Foundation

@MainActor
enum Strings {
    private static var bundle: Bundle { LocalizationManager.shared.bundle }

    private static func l(_ key: String) -> String {
        bundle.localizedString(forKey: key, value: nil, table: nil)
    }

    private static func l(_ key: String, _ args: CVarArg...) -> String {
        String(format: l(key), arguments: args)
    }

    private static func l(_ key: String, fallback: String) -> String {
        bundle.localizedString(forKey: key, value: fallback, table: nil)
    }

    // MARK: - General

    static var loading: String { l("loading") }
    static func lastUsedAgo(_ relative: String) -> String { l("lbl_last_used_ago", relative) }
    static var playerStreamLoading: String { l("player_stream_loading", fallback: "Loading stream…") }
    static var cancel: String { l("btn_cancel") }
    static var ok: String { l("lbl_ok") }
    static var yes: String { l("lbl_yes") }
    static var no: String { l("lbl_no") }
    static var save: String { l("lbl_save") }
    static var delete: String { l("lbl_delete") }
    static var edit: String { l("lbl_edit") }
    static var close: String { l("lbl_close") }
    static var back: String { l("lbl_back") }
    static var open: String { l("lbl_open") }
    static var remove: String { l("lbl_remove") }
    static var create: String { l("lbl_create") }
    static var clear: String { l("lbl_clear") }
    static var enabled: String { l("enabled") }
    static var disabled: String { l("disabled") }
    static var none: String { l("lbl_none") }
    static var unknown: String { l("lbl_bracket_unknown") }
    static var filters: String { l("filters") }
    static var noItems: String { l("lbl_no_items") }
    static var empty: String { l("lbl_empty") }
    static var name: String { l("lbl_name") }
    static var random: String { l("random") }

    // MARK: - Navigation

    static var home: String { l("lbl_home") }
    static var search: String { l("lbl_search") }
    static var settings: String { l("settings") }
    static var preferences: String { l("lbl_settings") }
    static var favorites: String { l("lbl_favorites") }
    static var genres: String { l("lbl_genres") }
    static var folders: String { l("lbl_folders") }

    // MARK: - Home Sections

    static var continueWatching: String { l("lbl_continue_watching") }
    static var continueListening: String { l("continue_listening") }
    static var nextUp: String { l("lbl_next_up") }
    static var recentlyAdded: String { l("lbl_latest") }
    static func recentlyAddedIn(_ library: String) -> String { l("lbl_latest_in", library) }
    static var myMedia: String { l("lbl_my_media") }
    static var playlists: String { l("lbl_playlists") }
    static var onNow: String { l("lbl_on_now") }
    static var comingUp: String { l("lbl_coming_up") }
    static var suggestedItems: String { l("lbl_suggested") }

    // MARK: - Content Types

    static var movies: String { l("lbl_movies") }
    static var tvSeries: String { l("lbl_tv_series") }
    static var episodes: String { l("lbl_episodes") }
    static var seasons: String { l("lbl_seasons") }
    static var collections: String { l("lbl_collections") }
    static var albums: String { l("lbl_albums") }
    static var artists: String { l("lbl_artists") }
    static var songs: String { l("lbl_songs") }
    static var videos: String { l("lbl_videos") }
    static var people: String { l("lbl_people") }
    static var programs: String { l("lbl_programs") }
    static var channels: String { l("channels") }
    static var recordings: String { l("lbl_recordings") }
    static var photoAlbums: String { l("photo_albums") }
    static var photos: String { l("photos") }
    static var series: String { l("lbl_series") }
    static var items: String { l("lbl_items") }
    static var other: String { l("lbl_other") }

    // MARK: - Item Details

    static var castAndCrew: String { l("lbl_cast_crew") }
    static var cast: String { l("lbl_cast") }
    static var guestStars: String { l("lbl_guest_stars") }
    static var specials: String { l("lbl_specials") }
    static var trailers: String { l("lbl_trailers") }
    static var additionalParts: String { l("lbl_additional_parts") }
    static var chapters: String { l("chapters") }
    static var similarItems: String { l("lbl_similar_items_library") }
    static var moreLikeThis: String { l("lbl_more_like_this") }
    static var directedBy: String { l("lbl_directed_by") }
    static var born: String { l("lbl_born") }
    static var runtime: String { l("lbl_runtime") }
    static func runtimeHoursMinutes(_ h: Int, _ m: Int) -> String { l("runtime_hours_minutes", h, m) }
    static func runtimeMinutes(_ m: Int) -> String { l("runtime_minutes", m) }
    static func endsAt(_ time: String) -> String { l("lbl_playback_control_ends", time) }
    static func resumeFrom(_ time: String) -> String { l("lbl_resume_from", time) }
    static var playFromBeginning: String { l("lbl_from_beginning") }
    static func seasonNumber(_ n: Int) -> String { l("lbl_season_number", n) }
    static func episodeNumber(_ n: Int) -> String { l("lbl_episode_number", n) }
    static func becauseYouWatched(_ title: String) -> String { l("because_you_watched", title) }

    // MARK: - Playback

    static var play: String { l("lbl_play") }
    static var pause: String { l("lbl_pause") }
    static var playAll: String { l("lbl_play_all") }
    static var shuffleAll: String { l("lbl_shuffle_all") }
    static var playFirstUnwatched: String { l("lbl_play_first_unwatched") }
    static var addToQueue: String { l("lbl_add_to_queue") }
    static var clearQueue: String { l("lbl_clear_queue") }
    static var removeFromQueue: String { l("lbl_remove_from_queue") }
    static var nowPlaying: String { l("lbl_now_playing") }
    static var playFromHere: String { l("lbl_play_from_here") }
    static var instantMix: String { l("lbl_instant_mix") }
    static var nextEpisode: String { l("lbl_next_episode") }
    static var previousEpisode: String { l("lbl_previous_episode") }
    static var goToSeries: String { l("lbl_goto_series") }
    static var audioTrack: String { l("lbl_audio_track") }
    static var subtitleTrack: String { l("lbl_subtitle_track") }
    static var subtitleDelay: String { l("lbl_subtitle_delay") }
    static var audioDelay: String { l("lbl_audio_delay") }
    static var playbackSpeed: String { l("lbl_playback_speed") }
    static var qualityProfile: String { l("lbl_quality_profile") }
    static var selectVersion: String { l("select_version") }
    static var zoom: String { l("lbl_zoom") }
    static var autoCrop: String { l("lbl_auto_crop") }
    static var stretch: String { l("lbl_stretch") }
    static var fit: String { l("lbl_fit") }
    static var rewind: String { l("rewind") }
    static var fastForward: String { l("fast_forward") }
    static var currentQueue: String { l("current_queue") }
    static var playerLyrics: String { l("player_lyrics") }
    static var playerQueue: String { l("player_queue") }
    static var playerPlayNext: String { l("player_play_next") }
    static var playerDownloadSubtitles: String { l("player_download_subtitles") }
    static var playerDownloadSubtitlesTitle: String { l("player_download_subtitles_title") }
    static var playerOpenSubtitlesSearch: String { l("player_open_subtitles_search") }
    static var playerSpeedNormal: String { l("player_speed_normal") }
    static var playerSearching: String { l("player_searching") }
    static var playerSubtitleSearchFailed: String { l("player_subtitle_search_failed") }
    static var playerSubtitleDownloadFailed: String { l("player_subtitle_download_failed") }
    static var playerStillWatchingDetail: String { l("player_still_watching_detail") }
    static var playerContinue: String { l("player_continue") }
    static var playerStop: String { l("player_stop") }
    static var playerPrevious: String { l("player_previous") }
    static var playerNext: String { l("player_next") }
    static var playerSubtitleDelayDown: String { l("player_subtitle_delay_down") }
    static var playerSubtitleDelayReset: String { l("player_subtitle_delay_reset") }
    static var playerSubtitleDelayUp: String { l("player_subtitle_delay_up") }
    static var playerPlaybackInformation: String { l("player_playback_information") }
    static var playerPlaybackSection: String { l("player_playback_section") }
    static var playerPlayMethod: String { l("player_play_method") }
    static var playerBackend: String { l("player_backend") }
    static var playerFallback: String { l("player_fallback") }
    static var playerContainer: String { l("player_container") }
    static var playerBitrate: String { l("player_bitrate") }
    static var playerVideoSection: String { l("player_video_section") }
    static var playerResolution: String { l("player_resolution") }
    static var playerHdr: String { l("player_hdr") }
    static var playerPlayerType: String { l("player_player_type") }
    static var playerCodec: String { l("player_codec") }
    static var playerBitDepth: String { l("player_bit_depth") }
    static var playerVideoBitrate: String { l("player_video_bitrate") }
    static var playerFrames: String { l("player_frames") }
    static var playerHdrMetadata: String { l("player_hdr_metadata") }
    static var playerMaxCll: String { l("player_max_cll") }
    static var playerMaxFall: String { l("player_max_fall") }
    static var playerTelemetry: String { l("player_telemetry") }
    static var playerToneMap: String { l("player_tone_map") }
    static var playerSinkHdr: String { l("player_sink_hdr") }
    static var playerContent: String { l("player_content") }
    static var playerInColor: String { l("player_in_color") }
    static var playerOutColor: String { l("player_out_color") }
    static var playerTarget: String { l("player_target") }
    static var playerActiveToneMapping: String { l("player_active_tone_mapping") }
    static var playerHardwareDecode: String { l("player_hardware_decode") }
    static var playerAudioSection: String { l("player_audio_section") }
    static var playerTrack: String { l("player_track") }
    static var playerChannels: String { l("player_channels") }
    static var playerAudioBitrate: String { l("player_audio_bitrate") }
    static var playerSampleRate: String { l("player_sample_rate") }
    static var playerFormat: String { l("player_format") }
    static var playerType: String { l("player_type") }
    static var playerExternal: String { l("player_external") }
    static var playerEmbedded: String { l("player_embedded") }
    static var playerUnknown: String { l("player_unknown") }
    static var playerUnknownShort: String { l("player_unknown_short") }
    static var playerNA: String { l("player_na") }
    static var playerDolbyVision: String { l("player_dolby_vision") }
    static var playerHdr10Plus: String { l("player_hdr10_plus") }
    static var playerHdr10: String { l("player_hdr10") }
    static var playerHlg: String { l("player_hlg") }
    static var playerHdrValue: String { l("player_hdr_value") }
    static var playerSdr: String { l("player_sdr") }
    static var playerCodecHevc: String { l("player_codec_hevc") }
    static var playerCodecAvc: String { l("player_codec_avc") }
    static var playerCodecAv1: String { l("player_codec_av1") }
    static var playerCodecVp9: String { l("player_codec_vp9") }
    static var playerAudioCodecEac3: String { l("player_audio_codec_eac3") }
    static var playerAudioCodecAc3: String { l("player_audio_codec_ac3") }
    static var playerAudioCodecTrueHd: String { l("player_audio_codec_truehd") }
    static var playerAudioCodecDts: String { l("player_audio_codec_dts") }
    static var playerAudioCodecAac: String { l("player_audio_codec_aac") }
    static var playerAudioCodecFlac: String { l("player_audio_codec_flac") }
    static var playerAudioCodecOpus: String { l("player_audio_codec_opus") }
    static var playerAudioCodecVorbis: String { l("player_audio_codec_vorbis") }
    static var playerMono: String { l("player_mono") }
    static var playerStereo: String { l("player_stereo") }
    static var playerBookCouldNotConnect: String { l("player_book_could_not_connect") }
    static var playerBookUnsupportedFormat: String { l("player_book_unsupported_format") }
    static var playerBookNoReadablePages: String { l("player_book_no_readable_pages") }
    static var playerBookUnableToLoad: String { l("player_book_unable_to_load") }
    static var playerBookDownloadFailed: String { l("player_book_download_failed") }
    static var playerBookInvalidPdf: String { l("player_book_invalid_pdf") }
    static var playerBookCbrNeedsServerChapters: String { l("player_book_cbr_needs_server_chapters") }
    static var playerBookInvalidCbz: String { l("player_book_invalid_cbz") }
    static var playerBookNoChapters: String { l("player_book_no_chapters") }
    static var playerBookComicPagesFailed: String { l("player_book_comic_pages_failed") }
    static func playerTrackCount(_ count: Int) -> String { l("player_track_count", count) }
    static func playerChapter(_ number: Int) -> String { l("player_chapter", number) }
    static func playerSubtitleDelay(_ delay: String) -> String { l("player_subtitle_delay", delay) }
    static func playerNoSubtitlesFound(_ language: String) -> String { l("player_no_subtitles_found", language) }
    static func playerFpsSuffix(_ fps: Int) -> String { l("player_fps_suffix", fps) }
    static func playerResolutionValue(_ width: Int, _ height: Int, _ fpsSuffix: String) -> String { l("player_resolution_value", width, height, fpsSuffix) }
    static func playerBitDepthValue(_ bitDepth: Int) -> String { l("player_bit_depth_value", bitDepth) }
    static func playerFramesValue(_ decoded: String, _ dropped: String) -> String { l("player_frames_value", decoded, dropped) }
    static func playerNitsValue(_ value: String) -> String { l("player_nits_value", value) }
    static func playerEmpty(_ count: Int) -> String { l("player_empty", count) }
    static func playerColorPair(_ first: String, _ second: String) -> String { l("player_color_pair", first, second) }
    static func playerSampleRateValue(_ khz: Double) -> String { l("player_sample_rate_value", khz) }
    static func playerBitrateMbps(_ mbps: Double) -> String { l("player_bitrate_mbps", mbps) }
    static func playerBitrateKbps(_ kbps: Int) -> String { l("player_bitrate_kbps", kbps) }
    static func playerBitrateBps(_ bps: Int) -> String { l("player_bitrate_bps", bps) }
    static func playerDolbyVisionProfile(_ profile: String, _ level: String) -> String { l("player_dolby_vision_profile", profile, level) }
    static func playerCodecProfileSuffix(_ profile: String) -> String { l("player_codec_profile_suffix", profile) }
    static func playerCodecLevelSuffix(_ level: Int) -> String { l("player_codec_level_suffix", level) }
    static func playerChannelsCount(_ channels: Int) -> String { l("player_channels_count", channels) }

    // MARK: - Playback Status

    static var videoError: String { l("video_error_unknown_error") }
    static var noPlayableItems: String { l("msg_no_playable_items") }
    static var playbackNotAllowed: String { l("msg_playback_not_allowed") }
    static var cannotPlay: String { l("msg_cannot_play") }
    static var seekError: String { l("seek_error") }
    static var playerError: String { l("player_error") }
    static var tooManyErrors: String { l("too_many_errors") }
    static var subtitlesLoading: String { l("msg_subtitles_loading") }

    // MARK: - Media Segments

    static var skipIntro: String { l("skip_intro") }
    static var skipOutro: String { l("skip_outro") }
    static var skipRecap: String { l("skip_recap") }
    static var skipCommercial: String { l("skip_commercial") }
    static var skipPreview: String { l("skip_preview") }
    static func playNextCountdown(_ s: Int) -> String { l("play_next_episode_countdown", s) }
    static var stillWatchingLabel: String { l("still_watching_label") }

    // MARK: - Item Actions

    static var favorite: String { l("lbl_favorite") }
    static var addFavorite: String { l("lbl_add_favorite") }
    static var removeFavorite: String { l("lbl_remove_favorite") }
    static var markWatched: String { l("lbl_mark_watched") }
    static var markUnwatched: String { l("lbl_mark_unwatched") }
    static var watched: String { l("lbl_watched") }
    static var unwatched: String { l("lbl_unwatched") }
    static var addToPlaylist: String { l("lbl_add_to_playlist") }
    static var createNewPlaylist: String { l("lbl_create_new_playlist") }
    static var removeFromPlaylist: String { l("lbl_remove_from_playlist") }
    static var addToWatchList: String { l("lbl_add_to_watch_list") }
    static var removeFromWatchList: String { l("lbl_remove_from_watch_list") }

    // MARK: - Auth / Login

    static var signIn: String { l("lbl_sign_in") }
    static var actionLogin: String { l("action_login") }
    static var signOut: String { l("lbl_sign_out") }
    static var switchUser: String { l("lbl_switch_user") }
    static var addUser: String { l("add_user") }
    static var enterServerAddress: String { l("lbl_enter_server_address") }
    static var whoIsWatching: String { l("who_is_watching") }
    static var authenticating: String { l("login_authenticating") }
    static var invalidCredentials: String { l("login_invalid_credentials") }
    static var serverUnavailable: String { l("login_server_unavailable") }
    static func connectingTo(_ server: String) -> String { l("login_connect_to", server) }
    static var usernameField: String { l("input_username") }
    static var passwordField: String { l("input_password") }
    static var connect: String { l("action_connect") }
    static var usePassword: String { l("action_use_password") }
    static var useQuickConnect: String { l("action_use_quickconnect") }
    static var savedServers: String { l("saved_servers") }
    static var discoveredServers: String { l("discovered_servers_title") }
    static var noDiscoveredServers: String { l("discovered_servers_empty") }
    static var welcomeTitle: String { l("welcome_title") }
    static var startupWelcomeContent: String { l("startup_welcome_content") }
    static var welcomeContent: String { l("welcome_content") }
    static var selectServer: String { l("lbl_select_server") }
    static var signOutAllUsers: String { l("sign_out_all_users") }
    static var accountActiveBadge: String { l("account_active_badge") }
    static var noStoredAccounts: String { l("account_switcher_no_accounts") }
    static var removeServer: String { l("lbl_remove_server") }
    static var manageServers: String { l("lbl_manage_servers") }
    static var gotIt: String { l("btn_got_it") }
    static var startupNoUsersFound: String { l("startup_no_users_found") }
    static var startupChangeServer: String { l("startup_change_server") }
    static var connectManually: String { l("startup_connect_manually") }
    static var embyConnect: String { l("startup_emby_connect") }
    static var startupDeleteServer: String { l("startup_delete_server") }
    static var startupTryAgain: String { l("startup_try_again") }
    static var startupEnterValidServerAddress: String { l("startup_enter_valid_server_address") }
    static var startupServerAddressPlaceholder: String { l("startup_server_address_placeholder") }
    static var loginQuickConnectConnecting: String { l("startup_quick_connect_connecting") }
    static var loginQuickConnectUnavailable: String { l("startup_quick_connect_unavailable") }
    static var loginQuickConnectEnterCode: String { l("startup_quick_connect_enter_code") }
    static var loginQuickConnectWaiting: String { l("startup_quick_connect_waiting") }
    static var loginQuickConnectAuthorized: String { l("startup_quick_connect_authorized") }
    static var startupGettingStarted: String { l("startup_getting_started") }
    static var startupConnectHelpDescription: String { l("startup_connect_help_description") }
    static var embyConnectSignInDescription: String { l("startup_emby_connect_sign_in_description") }
    static var embyConnectEmailOrUsername: String { l("startup_emby_connect_email_or_username") }
    static var embyConnectSigningIn: String { l("startup_emby_connect_signing_in") }
    static var embyConnectConnectingToServer: String { l("startup_emby_connect_connecting_to_server") }
    static var embyConnectNoServerAddress: String { l("startup_emby_connect_no_server_address") }
    static var embyConnectInvalidLocalUserId: String { l("startup_emby_connect_invalid_local_user_id") }
    static func startupRemoveSavedServer(_ server: String) -> String { l("startup_remove_saved_server", server) }
    static func serverUnsupportedVersionMinimum(_ version: String, _ minimum: String) -> String { l("startup_server_unsupported_minimum", version, minimum) }
    static func embyConnectUnableToConnect(_ address: String) -> String { l("startup_emby_connect_unable_to_connect", address) }
    static func embyConnectFailedToAddServer(_ address: String) -> String { l("startup_emby_connect_failed_to_add_server", address) }

    // MARK: - PIN

    static var pinCode: String { l("lbl_pin_code") }
    static var enterPin: String { l("lbl_enter_pin") }
    static var enterNewPin: String { l("lbl_enter_new_pin") }
    static var confirmPin: String { l("lbl_confirm_pin") }
    static var pinSet: String { l("lbl_pin_code_set") }
    static var pinChanged: String { l("lbl_pin_code_changed") }
    static var pinRemoved: String { l("lbl_pin_code_removed") }
    static var pinIncorrect: String { l("lbl_pin_code_incorrect") }
    static var pinMismatch: String { l("lbl_pin_code_mismatch") }
    static var forgotPin: String { l("lbl_forgot_pin") }
    static func pinTooShort(_ digits: Int) -> String { l("startup_pin_too_short", digits) }

    // MARK: - Server Issues

    static var serverUnableToConnect: String { l("server_issue_unable_to_connect") }
    static var serverInvalidProduct: String { l("server_issue_invalid_product") }
    static var serverMissingVersion: String { l("server_issue_missing_version") }
    static func serverUnsupportedVersion(_ v: String) -> String { l("server_issue_unsupported_version", v) }
    static var serverTimeout: String { l("server_issue_timeout") }
    static var serverSSLFailed: String { l("server_issue_ssl_handshake") }
    static var serverSetupIncomplete: String { l("server_setup_incomplete") }

    // MARK: - Settings

    static var authentication: String { l("pref_authentication_cat") }
    static var customization: String { l("pref_customization") }
    static var playbackSettings: String { l("pref_playback") }
    static var about: String { l("pref_about_title") }
    static var telemetry: String { l("pref_telemetry_category") }
    static var screensaver: String { l("pref_screensaver") }
    static var appearance: String { l("pref_appearance") }
    static var homeSections: String { l("home_sections") }
    static var focusColor: String { l("pref_focus_color") }
    static var librariesSettings: String { l("pref_libraries") }
    static var clockDisplay: String { l("pref_clock_display") }
    static var watchedIndicator: String { l("pref_watched_indicator") }
    static var maxBitrate: String { l("pref_max_bitrate_title") }
    static var maxResolution: String { l("pref_max_resolution_title") }
    static var subtitlesSettings: String { l("pref_subtitles") }
    static var mediaSegmentActions: String { l("pref_mediasegment_actions") }
    static var nextUpSettings: String { l("pref_playback_next_up") }
    static var prerollsEnabled: String { l("pref_prerolls_enabled") }
    static var prerollsEnabledDescription: String { l("pref_prerolls_enabled_description") }
    static var navbarPosition: String { l("pref_navbar_position") }
    static var liveTvSettings: String { l("pref_live_tv_cat") }
    static var licenses: String { l("licenses_link") }
    static var loginDescription: String { l("pref_login_description") }
    static var customizationDescription: String { l("pref_customization_description") }
    static var playbackDescription: String { l("pref_playback_description") }
    static var telemetryDescription: String { l("pref_telemetry_description") }
    static var plugin: String { l("pref_plugin_settings") }
    static var pluginSync: String { l("pref_plugin_sync_enable") }
    static var pluginSyncDescription: String { l("pref_plugin_sync_description") }
    static var licensesDescription: String { l("licenses_link_description") }
    static var advanced: String { l("advanced_settings") }
    static var liveTvPreferences: String { l("live_tv_preferences") }
    static var mediaSegmentsSettings: String { l("pref_playback_media_segments") }
    static var trickPlay: String { l("settings_trickplay") }
    static var trickPlayDescription: String { l("settings_trickplay_description") }
    static var authenticationSummary: String { l("settings_authentication_summary") }
    static var customizationSummary: String { l("settings_customization_summary") }
    static var homeSummary: String { l("settings_home_summary") }
    static var pluginSummary: String { l("settings_plugin_summary") }
    static var screensaverSummary: String { l("settings_screensaver_summary") }
    static var syncPlaySummary: String { l("settings_syncplay_summary") }
    static var parentalControlsSummary: String { l("settings_parental_controls_summary") }
    static var aboutSummary: String { l("settings_about_summary") }
    static var nextUpBehaviorDescription: String { l("settings_playback_next_up_behavior_description") }
    static var nextUpBehaviorTitle: String { l("pref_next_up_behavior_title") }
    static var nextUpTimeoutTitle: String { l("pref_next_up_timeout_title") }
    static var nextUpTimeoutDescription: String { l("settings_playback_next_up_timeout_description") }
    static var stillWatchingPrompt: String { l("settings_playback_still_watching") }
    static var stillWatchingPromptDescription: String { l("settings_playback_still_watching_description") }
    static var audioBehavior: String { l("settings_playback_audio_behavior") }
    static var audioBehaviorDescription: String { l("settings_playback_audio_behavior_description") }
    static var audioOutput: String { l("lbl_audio_output") }
    static var slideshowInterval: String { l("settings_slideshow_interval") }
    static var slideshowIntervalDescription: String { l("settings_slideshow_interval_description") }
    static var mediaSegmentsDescription: String { l("settings_media_segments_description") }
    static var advancedDescription: String { l("settings_advanced_description") }
    static var resumePreroll: String { l("lbl_resume_preroll") }
    static var skipForwardLength: String { l("skip_forward_length") }
    static var unpauseRewind: String { l("unpause_rewind_duration") }
    static var videoStartDelay: String { l("video_start_delay") }
    static var defaultZoom: String { l("default_video_zoom") }
    static var aboutVersion: String { l("settings_about_version") }
    static var aboutBuild: String { l("settings_about_build") }
    static var noLicensesFound: String { l("settings_licenses_none") }
    static var integrations: String { l("settings_integrations") }
    static var fetchLimit: String { l("settings_fetch_limit") }
    static var syncPlayMinDelaySpeed: String { l("settings_syncplay_min_delay_speed") }
    static var syncPlayMaxDelaySpeed: String { l("settings_syncplay_max_delay_speed") }
    static var syncPlaySpeedDuration: String { l("settings_syncplay_speed_duration") }
    static var syncPlayMinDelaySkip: String { l("settings_syncplay_min_delay_skip") }
    static var syncPlayExtraOffset: String { l("settings_syncplay_extra_offset") }
    static var channelOrder: String { l("settings_channel_order") }
    static var settingsPosterSize: String { l("settings_poster_size") }
    static var settingsHomePosterSizeDescription: String { l("settings_home_poster_size_description") }
    static var settingsImageType: String { l("settings_image_type") }
    static var settingsHomeImageTypeDescription: String { l("settings_home_image_type_description") }
    static var settingsSections: String { l("settings_sections") }
    static var settingsLibraryVisibility: String { l("settings_library_visibility") }
    static var settingsLibraryVisibilitySummary: String { l("settings_library_visibility_summary") }
    static var settingsLibraryVisibilityDescription: String { l("settings_library_visibility_description") }
    static var settingsLibraryVisibilityShowInNavigation: String { l("settings_library_visibility_show_in_navigation") }
    static var settingsLibraryVisibilityShowInLatestMedia: String { l("settings_library_visibility_show_in_latest_media") }
    static var settingsLibraryVisibilityNoLibraries: String { l("settings_library_visibility_no_libraries") }
    static var settingsRearrangeHint: String { l("settings_rearrange_hint") }
    static var settingsResetToDefaults: String { l("settings_reset_to_defaults") }
    static var comingSoon: String { l("settings_coming_soon") }
    static var licenseLabel: String { l("license_license") }
    static func currentValue(_ value: String) -> String { l("settings_current_value", value) }
    static func episodeCount(_ count: Int) -> String { l("settings_episode_count", count) }
    static var secondsShort: String { l("unit_seconds_short") }
    static var millisecondsShort: String { l("unit_milliseconds_short") }

    // MARK: - Settings Values

    static var imageTypePoster: String { l("image_type_poster") }
    static var imageTypeThumbnail: String { l("image_type_thumbnail") }
    static var imageTypeBanner: String { l("image_type_banner") }
    static var imageTypeSquare: String { l("image_type_square") }
    static var always: String { l("lbl_always") }
    static var never: String { l("lbl_never") }

    // MARK: - Sorting / Filtering

    static var sortBy: String { l("lbl_sort_by") }
    static var dateAdded: String { l("lbl_date_added") }
    static var premierDate: String { l("lbl_premier_date") }
    static var criticRating: String { l("lbl_critic_rating") }
    static var communityRating: String { l("lbl_community_rating") }
    static var rating: String { l("lbl_rating") }
    static var allItems: String { l("lbl_all_items") }
    static var from: String { l("lbl_from") }
    static var byLetter: String { l("lbl_by_letter") }
    static var byName: String { l("lbl_by_name") }

    // MARK: - Live TV

    static var liveTvGuide: String { l("lbl_live_tv_guide") }
    static var schedule: String { l("lbl_schedule") }
    static var record: String { l("lbl_record") }
    static var cancelRecording: String { l("lbl_cancel_recording") }
    static var seriesRecordings: String { l("lbl_series_recordings") }
    static var recentRecordings: String { l("lbl_recent_recordings") }
    static var noRecordings: String { l("lbl_no_recordings") }
    static var today: String { l("lbl_today") }
    static var tomorrow: String { l("lbl_tomorrow") }
    static var tuneToChannel: String { l("lbl_tune_to_channel") }
    static var statusTitle: String { l("lbl_status_title") }
    static var sports: String { l("lbl_sports") }
    static var kids: String { l("lbl_kids") }
    static var news: String { l("lbl_news") }
    static var premiere: String { l("lbl_premiere") }
    static var liveTvGuideShort: String { l("live_tv_guide_short") }
    static var liveTvPreviousDay: String { l("live_tv_previous_day") }
    static var liveTvNextDay: String { l("live_tv_next_day") }
    static var liveTvAllChannels: String { l("live_tv_all_channels") }
    static var liveTvNoProgramInformation: String { l("live_tv_no_program_information") }
    static var liveTvLoadingGuideData: String { l("live_tv_loading_guide_data") }
    static var liveTvFailedToLoadGuide: String { l("live_tv_failed_to_load_guide") }
    static var liveTvRetry: String { l("live_tv_retry") }
    static var liveTvBadgeHD: String { l("live_tv_badge_hd") }
    static var liveTvBadgeNew: String { l("live_tv_badge_new") }
    static var liveTvBadgeRepeat: String { l("live_tv_badge_repeat") }
    static var liveTvBadgeLive: String { l("live_tv_badge_live") }
    static var liveTvWatch: String { l("live_tv_watch") }
    static var liveTvFavoriteChannel: String { l("live_tv_favorite_channel") }
    static var liveTvUnfavoriteChannel: String { l("live_tv_unfavorite_channel") }
    static var liveTvOnNow: String { l("live_tv_on_now") }
    static var liveTvMovie: String { l("live_tv_movie") }
    static var liveTvLive: String { l("live_tv_live") }
    static var liveTvRepeat: String { l("live_tv_repeat") }
    static var liveTvNoRecordingsFound: String { l("live_tv_no_recordings_found") }
    static var liveTvNoScheduledRecordings: String { l("live_tv_no_scheduled_recordings") }
    static var liveTvNoSeriesRecordings: String { l("live_tv_no_series_recordings") }
    static var liveTvLoadingRecordings: String { l("live_tv_loading_recordings") }
    static var liveTvFailedToLoadRecordings: String { l("live_tv_failed_to_load_recordings") }
    static var liveTvScheduledRecording: String { l("live_tv_scheduled_recording") }
    static var liveTvSeriesRecording: String { l("live_tv_series_recording") }
    static var liveTvScheduled: String { l("live_tv_scheduled") }
    static var liveTvChannel: String { l("live_tv_channel") }
    static var liveTvDuration: String { l("live_tv_duration") }
    static var liveTvYear: String { l("live_tv_year") }
    static var liveTvAnyTime: String { l("live_tv_any_time") }
    static var liveTvAnyChannel: String { l("live_tv_any_channel") }
    static var liveTvNewOnly: String { l("live_tv_new_only") }
    static var liveTvGuideIndicatorsUpper: String { l("live_tv_guide_indicators_upper") }
    static var liveTvFavoritesAtTop: String { l("live_tv_favorites_at_top") }
    static var liveTvShowFavoriteChannelsFirst: String { l("live_tv_show_favorite_channels_first") }
    static var liveTvColorCodedBackgrounds: String { l("live_tv_color_coded_backgrounds") }
    static var liveTvColorGuideEntriesByGenre: String { l("live_tv_color_guide_entries_by_genre") }
    static var liveTvShowHdIndicator: String { l("live_tv_show_hd_indicator") }
    static var liveTvDisplayHdBadge: String { l("live_tv_display_hd_badge") }
    static var liveTvShowLiveIndicator: String { l("live_tv_show_live_indicator") }
    static var liveTvDisplayLiveBadge: String { l("live_tv_display_live_badge") }
    static var liveTvShowNewIndicator: String { l("live_tv_show_new_indicator") }
    static var liveTvDisplayNewBadge: String { l("live_tv_display_new_badge") }
    static var liveTvShowRepeatIndicator: String { l("live_tv_show_repeat_indicator") }
    static var liveTvDisplayRepeatBadge: String { l("live_tv_display_repeat_badge") }
    static var liveTvGuideFilters: String { l("live_tv_guide_filters") }
    static var liveTvFilterGuideByContentType: String { l("live_tv_filter_guide_by_content_type") }
    static var liveTvAll: String { l("live_tv_all") }
    static var liveTvTime: String { l("live_tv_time") }
    static var liveTvCancelSeries: String { l("live_tv_cancel_series") }
    static var liveTvNoServerConnection: String { l("live_tv_no_server_connection") }
    static var liveTvPast24Hours: String { l("past_24_hours") }
    static var liveTvPastWeek: String { l("past_week") }
    static func liveTvMinutes(_ minutes: Int) -> String { l("live_tv_minutes", minutes) }
    static func liveTvRecordingsCount(_ count: Int) -> String { l("live_tv_recordings_count", count) }
    static func liveTvScheduledCount(_ count: Int) -> String { l("live_tv_scheduled_count", count) }
    static func liveTvSeriesCount(_ count: Int) -> String { l("live_tv_series_count", count) }
    static func liveTvRecordingActionFailed(_ reason: String) -> String { l("live_tv_recording_action_failed", reason) }
    static func liveTvFailedToUpdateFavorite(_ reason: String) -> String { l("live_tv_failed_to_update_favorite", reason) }
    static func liveTvFailedToDeleteRecording(_ reason: String) -> String { l("live_tv_failed_to_delete_recording", reason) }
    static func liveTvFailedToCancelRecording(_ reason: String) -> String { l("live_tv_failed_to_cancel_recording", reason) }
    static func liveTvFailedToCancelSeriesRecording(_ reason: String) -> String { l("live_tv_failed_to_cancel_series_recording", reason) }

    // MARK: - Media Bar

    static var mediaBarTitle: String { l("pref_media_bar_title") }
    static var mediaBarLoading: String { l("lbl_media_bar_loading") }
    static var mediaBarError: String { l("lbl_media_bar_error") }

    // MARK: - Jellyseerr

    static var seerrTitle: String { l("seerr_title") }
    static var seerrUnknown: String { l("seerr_unknown") }
    static var seerrBiography: String { l("seerr_biography") }
    static var seerrAppearances: String { l("seerr_appearances") }
    static var seerrShowMore: String { l("seerr_show_more") }
    static var seerrShowLess: String { l("seerr_show_less") }
    static var seerrRequestAction: String { l("seerr_request_action") }
    static var seerrTrailer: String { l("seerr_trailer") }
    static var seerrTmdbScore: String { l("seerr_tmdb_score") }
    static var seerrReleaseDate: String { l("seerr_release_date") }
    static var seerrRevenue: String { l("seerr_revenue") }
    static var seerrBudget: String { l("seerr_budget") }
    static var seerrFirstAired: String { l("seerr_first_aired") }
    static var seerrLastAired: String { l("seerr_last_aired") }
    static var seerrNetworks: String { l("seerr_networks") }
    static var seerrRecommendations: String { l("seerr_recommendations") }
    static var seerrKeywords: String { l("seerr_keywords") }
    static var seerrSelectSeasons: String { l("seerr_select_seasons") }
    static var seerrSelectAll: String { l("seerr_select_all") }
    static var seerrConfirm: String { l("seerr_confirm") }
    static var seerrAdvancedOptions: String { l("seerr_advanced_options") }
    static var seerrQualityProfile: String { l("seerr_quality_profile") }
    static var seerrRootFolder: String { l("seerr_root_folder") }
    static var seerrSkip: String { l("seerr_skip") }
    static var seerrSelectQuality: String { l("seerr_select_quality") }
    static var seerrQualityStandardRequest: String { l("seerr_quality_standard_request") }
    static var seerrQualityUltraHdRequest: String { l("seerr_quality_ultra_hd_request") }
    static var seerrNoRequestQualitiesAvailable: String { l("seerr_no_request_qualities_available") }
    static var seerrSortAndFilter: String { l("seerr_sort_and_filter") }
    static var seerrSortByUpper: String { l("seerr_sort_by_upper") }
    static var seerrFiltersUpper: String { l("seerr_filters_upper") }
    static var seerrDisplaySettings: String { l("seerr_display_settings") }
    static var seerrPosterSizeUpper: String { l("seerr_poster_size_upper") }
    static var seerrSortPopularity: String { l("seerr_sort_popularity") }
    static var seerrSortReleaseDate: String { l("seerr_sort_release_date") }
    static var seerrFilterShowAll: String { l("seerr_filter_show_all") }
    static var seerrFilterAvailableOnly: String { l("seerr_filter_available_only") }
    static var seerrFilterRequestedOnly: String { l("seerr_filter_requested_only") }
    static var seerrFilterAvailable: String { l("seerr_filter_available") }
    static var seerrFilterRequested: String { l("seerr_filter_requested") }
    static var seerrMovie: String { l("seerr_movie") }
    static var seerrSeriesGenres: String { l("seerr_series_genres") }
    static var seerrMovieGenres: String { l("seerr_movie_genres") }
    static var seerrShowing: String { l("seerr_showing") }
    static var seerrStatusNotRequested: String { l("seerr_status_not_requested") }
    static var seerrStatusAvailable: String { l("seerr_status_available") }
    static var seerrStatusPartiallyAvailable: String { l("seerr_status_partially_available") }
    static var seerrStatusPending: String { l("seerr_status_pending") }
    static var seerrStatusApproved: String { l("seerr_status_approved") }
    static var seerrStatusDeclined: String { l("seerr_status_declined") }
    static var seerrStatusProcessing: String { l("seerr_status_processing") }
    static var seerrStatusBlacklisted: String { l("seerr_status_blacklisted") }
    static var seerrUnknownError: String { l("seerr_unknown_error") }
    static var seerrHttpClientNotInitialized: String { l("seerr_http_client_not_initialized") }
    static var seerrNoActiveJellyfinUser: String { l("seerr_no_active_jellyfin_user") }
    static var seerrNotInMoonfinProxyMode: String { l("seerr_not_in_moonfin_proxy_mode") }
    static func seerrSeason(_ number: Int) -> String { l("seerr_season", number) }
    static func seerrBornDate(_ date: String) -> String { l("seerr_born_date", date) }
    static func seerrInPlace(_ place: String) -> String { l("seerr_in_place", place) }
    static func seerrDiedDate(_ date: String) -> String { l("seerr_died_date", date) }
    static func seerrRequestMore(_ quality: String) -> String { l("seerr_request_more", quality) }
    static func seerrRequest(_ quality: String) -> String { l("seerr_request", quality) }
    static func seerrQualityPending(_ quality: String) -> String { l("seerr_quality_pending", quality) }
    static func seerrQualityProcessing(_ quality: String) -> String { l("seerr_quality_processing", quality) }
    static func seerrQualityAvailable(_ quality: String) -> String { l("seerr_quality_available", quality) }
    static func seerrQualityBlacklisted(_ quality: String) -> String { l("seerr_quality_blacklisted", quality) }
    static func seerrItemsCount(_ countText: String) -> String { l("seerr_items_count", countText) }
    static func seerrCountOf(_ current: Int, _ total: Int) -> String { l("seerr_count_of", current, total) }
    static func seerrFromFilterName(_ name: String) -> String { l("seerr_from_filter_name", name) }
    static func seerrSortedBy(_ sort: String) -> String { l("seerr_sorted_by", sort) }
    static func seerrMoonfinLoginFailed(_ message: String) -> String { l("seerr_moonfin_login_failed", message) }
    static var seerrEnterServerUrlFirst: String { l("seerr_enter_server_url_first") }
    static var seerrConnecting: String { l("seerr_connecting") }
    static var seerrConnected: String { l("seerr_connected") }
    static var seerrTesting: String { l("seerr_testing") }
    static var seerrConnectionFailed: String { l("seerr_connection_failed") }
    static func seerrFailed(_ message: String) -> String { l("seerr_failed", message) }

    static var jellyseerr: String { l("jellyseerr") }
    static var jellyseerrEnabled: String { l("jellyseerr_enabled") }
    static var jellyseerrServerUrl: String { l("jellyseerr_server_url") }
    static var jellyseerrTestConnection: String { l("jellyseerr_test_connection") }
    static var jellyseerrConnectionSuccess: String { l("jellyseerr_connection_success") }
    static var jellyseerrConnectionError: String { l("jellyseerr_connection_error") }

    // MARK: - SyncPlay

    static var syncPlay: String { l("syncplay") }
    static var syncPlayCreateGroup: String { l("syncplay_create_group") }
    static var syncPlayJoinGroup: String { l("syncplay_join_group") }
    static var syncPlayLeaveGroup: String { l("syncplay_leave_group") }
    static var syncPlayNoGroups: String { l("syncplay_no_groups") }
    static var syncPlayDisabledTitle: String { l("syncplay_disabled_title") }
    static var syncPlayDisabledMessage: String { l("syncplay_disabled_message") }
    static var syncPlayServerUnsupportedTitle: String { l("syncplay_server_unsupported_title") }
    static var syncPlayServerUnsupportedMessage: String { l("syncplay_server_unsupported_message") }
    static var syncPlayInGroup: String { l("syncplay_in_group") }
    static var syncPlayParticipants: String { l("syncplay_participants") }
    static var syncPlayGroupOptions: String { l("syncplay_group_options") }
    static var syncPlayIgnoreWait: String { l("syncplay_ignore_wait") }
    static var syncPlayIgnoreWaitDescription: String { l("syncplay_ignore_wait_description") }
    static var syncPlaySyncCurrentQueue: String { l("syncplay_sync_current_queue") }
    static var syncPlayGroupQueue: String { l("syncplay_group_queue") }
    static var syncPlayQueueCurrent: String { l("syncplay_queue_current") }
    static var syncPlayQueueNext: String { l("syncplay_queue_next") }
    static var syncPlayQueueEmpty: String { l("syncplay_queue_empty") }
    static var syncPlayDefaultGroupName: String { l("syncplay_default_group_name") }
    static var syncPlayNewGroup: String { l("syncplay_new_group") }
    static var syncPlayAvailableGroups: String { l("syncplay_available_groups") }
    static var syncPlayRefresh: String { l("syncplay_refresh") }
    static var syncPlaySet: String { l("syncplay_set") }
    static var syncPlayUp: String { l("syncplay_up") }
    static var syncPlayDown: String { l("syncplay_down") }
    static var syncPlayRepeatOff: String { l("syncplay_repeat_off") }
    static var syncPlayRepeatOne: String { l("syncplay_repeat_one") }
    static var syncPlayRepeatAll: String { l("syncplay_repeat_all") }
    static var syncPlayShuffleOn: String { l("syncplay_shuffle_on") }
    static var syncPlayParticipantSingular: String { l("syncplay_participant_singular") }
    static var syncPlayParticipantPlural: String { l("syncplay_participant_plural") }
    static func syncPlayRepeatValue(_ value: String) -> String { l("syncplay_repeat_value", value) }
    static func syncPlayShuffleValue(_ value: String) -> String { l("syncplay_shuffle_value", value) }
    static func syncPlayParticipantsLine(_ count: Int, _ label: String, _ state: String) -> String { l("syncplay_participants_line", count, label, state) }

    // MARK: - Parental Controls

    static var parentalControls: String { l("pref_parental_controls") }

    // MARK: - Updates

    static var checkForUpdates: String { l("pref_check_for_updates") }
    static var noUpdatesAvailable: String { l("msg_no_updates_available") }
    static func updateAvailable(_ version: String) -> String { l("msg_update_available", version) }

    // MARK: - Exit

    static var exit: String { l("lbl_exit") }
    static var exitConfirmTitle: String { l("exit_confirmation_title") }
    static var exitConfirmMessage: String { l("exit_confirmation_message") }

    // MARK: - Errors

    static var errorLoadingData: String { l("msg_error_loading_data") }
    static var shuffleError: String { l("shuffle_error") }
    static var shuffleNoItems: String { l("shuffle_no_items_found") }

    // Networking and Shared Error Strings
    static var networkErrorInvalidUrl: String { l("network_error_invalid_url") }
    static func networkErrorHttpError(_ code: Int) -> String { l("network_error_http_error", code) }
    static func networkErrorDecodingError(_ detail: String) -> String { l("network_error_decoding_error", detail) }
    static var networkErrorUnauthorized: String { l("network_error_unauthorized") }
    static var networkErrorServerUnavailable: String { l("network_error_server_unavailable") }
    static var networkUserInvalidServerAddress: String { l("network_user_invalid_server_address") }
    static var networkUserSessionExpired: String { l("network_user_session_expired") }
    static var networkUserAccessDenied: String { l("network_user_access_denied") }
    static var networkUserContentNotFound: String { l("network_user_content_not_found") }
    static var networkUserRequestTimedOut: String { l("network_user_request_timed_out") }
    static var networkUserTooManyRequests: String { l("network_user_too_many_requests") }
    static var networkUserServerError: String { l("network_user_server_error") }
    static func networkUserRequestFailedHttp(_ code: Int) -> String { l("network_user_request_failed_http", code) }
    static var networkUserUnexpectedServerResponse: String { l("network_user_unexpected_server_response") }
    static var networkUserNoInternet: String { l("network_user_no_internet") }
    static var networkUserConnectionTimedOut: String { l("network_user_connection_timed_out") }
    static var networkUserUnableToReachServer: String { l("network_user_unable_to_reach_server") }
    static var networkUserSecureConnectionFailed: String { l("network_user_secure_connection_failed") }
    static var networkUserNetworkError: String { l("network_user_network_error") }
    static var networkUserServerIsUnavailable: String { l("network_user_server_is_unavailable") }

    // App-Level UI
    static var loadingTrailer: String { l("app_loading_trailer") }
    static var unableToPlayTrailer: String { l("app_unable_to_play_trailer") }
    static var trailerPlaybackFailed: String { l("app_trailer_playback_failed") }

    // MARK: - Search, Library, and Details

    // Search
    static var searchYourLibrary: String { l("search_your_library") }
    static var searchNoResults: String { l("search_no_results") }
    static func searchEpisodeFormat(_ s: Int, _ e: Int) -> String { l("search_episode_format", s, e) }
    static func seasonEpisodeCompact(_ s: Int, _ e: Int) -> String { l("season_episode_compact", s, e) }
    static func episodeOnlyCompact(_ e: Int) -> String { l("episode_only_compact", e) }

    // Library — Suggestions
    static var suggestionsTitle: String { l("suggestions_title") }
    static var noSuggestionsAvailable: String { l("no_suggestions_available") }
    static var watchMoviesForRecommendations: String { l("watch_movies_for_recommendations") }

    // Library — Genres
    static var noGenresFound: String { l("no_genres_found") }
    static func genresCount(_ n: Int) -> String { l("genres_count", n) }
    static var sortGenres: String { l("sort_genres") }

    // Library — General
    static var noItemsFound: String { l("no_items_found") }
    static func itemsCount(_ n: Int) -> String { l("items_count", n) }
    static var displaySettings: String { l("display_settings") }
    static var imageTypeUpper: String { l("image_type_upper") }
    static var posterSizeUpper: String { l("poster_size_upper") }
    static var sortAndFilter: String { l("sort_and_filter") }
    static var sortByUpper: String { l("sort_by_upper") }
    static var filtersUpper: String { l("filters_upper") }
    static var favoritesOnly: String { l("favorites_only") }
    static var unwatchedOnly: String { l("unwatched_only") }
    static var noFavoritesYet: String { l("no_favorites_yet") }

    // Library — Music
    static var albumArtists: String { l("album_artists") }
    static var randomAlbum: String { l("random_album") }
    static var views: String { l("lbl_views") }
    static func musicItemsAcrossSections(_ items: Int, _ sections: Int) -> String { l("music_items_across_sections", items, sections) }
    static var playlist: String { l("playlist_singular") }
    static var artistSingular: String { l("artist_singular") }

    // Library — Genre Sort
    static var genreSortNameAsc: String { l("genre_sort_name_asc") }
    static var genreSortNameDesc: String { l("genre_sort_name_desc") }
    static var genreSortMostItems: String { l("genre_sort_most_items") }
    static var genreSortLeastItems: String { l("genre_sort_least_items") }

    // Details — Item
    static var deleteItemConfirmation: String { l("delete_item_confirmation") }
    static var unableToLoadItem: String { l("unable_to_load_item") }
    static var goBack: String { l("go_back") }

    // Details — Action Buttons
    static var resume: String { l("lbl_resume_action") }
    static var restart: String { l("lbl_restart_action") }
    static var shuffle: String { l("lbl_shuffle_action") }
    static var nextShort: String { l("lbl_next_short") }
    static var versionAction: String { l("lbl_version_action") }
    static var audioAction: String { l("lbl_audio_action") }
    static var subtitlesAction: String { l("lbl_subtitles_action") }
    static var getSubs: String { l("lbl_get_subs") }
    static var trailer: String { l("lbl_trailer_short") }
    static var favorited: String { l("lbl_favorited") }
    static var addToList: String { l("lbl_add_to_list") }
    static var addToFavorites: String { l("add_to_favorites_action") }
    static var removeFromFavorites: String { l("remove_from_favorites_action") }

    // Details — Playlist
    static var failedLoadPlaylists: String { l("failed_load_playlists") }
    static var failedAddToPlaylist: String { l("failed_add_to_playlist") }
    static var failedCreatePlaylist: String { l("failed_create_playlist") }

    // Details — Cards & Context Menus
    static func episodeLabel(_ num: Int) -> String { l("episode_label", num) }
    static var deleteFromPlaylist: String { l("delete_from_playlist") }
    static var moveUp: String { l("move_up") }
    static var moveDown: String { l("move_down") }
    static var goToAlbum: String { l("go_to_album") }
    static var goToArtist: String { l("go_to_artist") }
    static var pressToExpand: String { l("press_to_expand") }

    // MARK: - Toolbar and Core Components

    // Navigation labels
    static var libraries: String { l("lbl_libraries") }

    // Shuffle Dialog
    static var shuffleBy: String { l("shuffle_by") }
    static var selectLibrary: String { l("select_library") }
    static var allLibraries: String { l("all_libraries") }
    static var selectGenre: String { l("select_genre") }
    static var quickShuffle: String { l("quick_shuffle") }
    static var librarySingular: String { l("lbl_library") }
    static var genreSingular: String { l("lbl_genre") }
    static var loadingGenres: String { l("loading_genres") }

    // Error Views
    static var serverUnavailableTitle: String { l("server_unavailable_title") }
    static func unableToConnectTo(_ name: String) -> String { l("unable_to_connect_to", name) }
    static var retry: String { l("lbl_retry") }
    static var switchServerAction: String { l("lbl_switch_server") }
    static var dismiss: String { l("lbl_dismiss") }
    static var authenticationRequired: String { l("authentication_required") }
    static var connectionError: String { l("connection_error") }
    static var errorTitle: String { l("error_title") }

    // MARK: - Preferences and Shared Models

    // Shared labels
    static var tvShows: String { l("tv_shows") }
    static var both: String { l("both") }
    static var top: String { l("top") }
    static var left: String { l("left") }
    static var vertical: String { l("vertical") }
    static var horizontal: String { l("horizontal") }
    static var optionAuto: String { l("option_auto") }
    static var collectionSingular: String { l("collection_singular") }
    static var liveTv: String { l("live_tv") }
    static var systemDefault: String { l("system_default") }
    static func slideshowSeconds(_ seconds: Int) -> String { l("slideshow_seconds", seconds) }

    // Preference values
    static var nextUpExtended: String { l("next_up_extended") }
    static var nextUpMinimal: String { l("next_up_minimal") }
    static var defaultTrack: String { l("default_track") }
    static var previouslySelected: String { l("previously_selected") }
    static var directStream: String { l("direct_stream") }
    static var downmixToStereo: String { l("downmix_to_stereo") }
    static var posterSizeSmallest: String { l("poster_size_smallest") }
    static var posterSizeSmall: String { l("poster_size_small") }
    static var posterSizeMedium: String { l("poster_size_medium") }
    static var posterSizeLarge: String { l("poster_size_large") }
    static var posterSizeXLarge: String { l("poster_size_x_large") }
    static var screensaverLogo: String { l("screensaver_logo") }
    static var screensaverLibraryShowcase: String { l("screensaver_library_showcase") }
    static var screensaverNowPlaying: String { l("screensaver_now_playing") }
    static var navigationOnly: String { l("navigation_only") }
    static var inVideo: String { l("in_video") }
    static var hideAfterWatched: String { l("hide_after_watched") }
    static var episodesOnly: String { l("episodes_only") }
    static var channelNumber: String { l("channel_number") }
    static var lastPlayed: String { l("last_played") }
    static var seasonWinter: String { l("season_winter") }
    static var seasonSpring: String { l("season_spring") }
    static var seasonSummer: String { l("season_summer") }
    static var seasonHalloween: String { l("season_halloween") }
    static var seasonFall: String { l("season_fall") }
    static var authLastUser: String { l("auth_last_user") }
    static var authSpecificUser: String { l("auth_specific_user") }
    static var lastUsed: String { l("last_used") }
    static var alphabetical: String { l("alphabetical") }

    // Colors
    static var colorWhite: String { l("color_white") }
    static var colorBlack: String { l("color_black") }
    static var colorGray: String { l("color_gray") }
    static var colorRed: String { l("color_red") }
    static var colorGreen: String { l("color_green") }
    static var colorBlue: String { l("color_blue") }
    static var colorYellow: String { l("color_yellow") }
    static var colorMagenta: String { l("color_magenta") }
    static var colorCyan: String { l("color_cyan") }
    static var colorPurple: String { l("color_purple") }
    static var colorTeal: String { l("color_teal") }
    static var colorNavy: String { l("color_navy") }
    static var colorCharcoal: String { l("color_charcoal") }
    static var colorBrown: String { l("color_brown") }
    static var colorDarkBlue: String { l("color_dark_blue") }
    static var colorDarkRed: String { l("color_dark_red") }
    static var colorDarkGreen: String { l("color_dark_green") }
    static var colorSlate: String { l("color_slate") }
    static var colorIndigo: String { l("color_indigo") }

    // Home / Media Bar
    static var latestMedia: String { l("latest_media") }
    static var myMediaSmall: String { l("my_media_small") }

    // Seerr row labels
    static var seerrRecentRequests: String { l("seerr_recent_requests") }
    static var seerrRecentlyAdded: String { l("seerr_recently_added") }
    static var seerrTrending: String { l("seerr_trending") }
    static var seerrPopularMovies: String { l("seerr_popular_movies") }
    static var seerrUpcomingMovies: String { l("seerr_upcoming_movies") }
    static var seerrStudios: String { l("seerr_studios") }
    static var seerrPopularSeries: String { l("seerr_popular_series") }
    static var seerrUpcomingSeries: String { l("seerr_upcoming_series") }

    // Rating sources
    static var ratingRottenTomatoes: String { l("rating_rotten_tomatoes") }
    static var ratingRtAudience: String { l("rating_rt_audience") }
    static var ratingImdb: String { l("rating_imdb") }
    static var ratingTmdb: String { l("rating_tmdb") }
    static var ratingMetacritic: String { l("rating_metacritic") }
    static var ratingMetacriticUser: String { l("rating_metacritic_user") }
    static var ratingTrakt: String { l("rating_trakt") }
    static var ratingLetterboxd: String { l("rating_letterboxd") }
    static var ratingRogerEbert: String { l("rating_roger_ebert") }
    static var ratingMyAnimeList: String { l("rating_myanimelist") }
    static var ratingAniList: String { l("rating_anilist") }


    // MARK: - Localized (auto-generated sweep)

    static var addToPlaylistDialogNewPlaylist: String { l("addtoplaylistdialog_new_playlist") }
    static var addToPlaylistDialogPlaylistName: String { l("addtoplaylistdialog_playlist_name") }
    static var folderBrowseScreenEmptyFolder: String { l("folderbrowsescreen_empty_folder") }
    static var folderBrowseScreenNoFolders: String { l("msg_no_folders") }
    static var homeViewModelActiveRecordings: String { l("homeviewmodel_active_recordings") }
    static var homeViewModelAlbumPlural: String { l("homeviewmodel_album_plural") }
    static var homeViewModelAlbumSingular: String { l("homeviewmodel_album_singular") }
    static var homeViewModelBookPlural: String { l("homeviewmodel_book_plural") }
    static var homeViewModelBookSingular: String { l("homeviewmodel_book_singular") }
    static var homeViewModelCollectionPlural: String { l("homeviewmodel_collection_plural") }
    static var homeViewModelCollectionSingular: String { l("homeviewmodel_collection_singular") }
    static var homeViewModelComingUp: String { l("homeviewmodel_coming_up") }
    static var homeViewModelContinueListening: String { l("homeviewmodel_continue_listening") }
    static var homeViewModelContinueReading: String { l("homeviewmodel_continue_reading") }
    static var homeViewModelContinueWatching: String { l("homeviewmodel_continue_watching") }
    static var homeViewModelFavoriteAlbums: String { l("homeviewmodel_favorite_albums") }
    static var homeViewModelFavoriteArtists: String { l("homeviewmodel_favorite_artists") }
    static var homeViewModelFavoriteEpisodes: String { l("homeviewmodel_favorite_episodes") }
    static var homeViewModelFavoriteMovies: String { l("homeviewmodel_favorite_movies") }
    static var homeViewModelFavoriteMusicVideos: String { l("homeviewmodel_favorite_music_videos") }
    static var homeViewModelFavoritePeople: String { l("homeviewmodel_favorite_people") }
    static var homeViewModelFavoriteSeries: String { l("homeviewmodel_favorite_series") }
    static var homeViewModelFavoriteSongs: String { l("homeviewmodel_favorite_songs") }
    static func homeViewModelLatestX(_ name: String) -> String { l("homeviewmodel_latest_x", name) }
    static var homeViewModelMoviePlural: String { l("homeviewmodel_movie_plural") }
    static var homeViewModelMovieSingular: String { l("homeviewmodel_movie_singular") }
    static var homeViewModelMyMedia: String { l("homeviewmodel_my_media") }
    static var homeViewModelNextUp: String { l("homeviewmodel_next_up") }
    static var homeViewModelOnNow: String { l("homeviewmodel_on_now") }
    static var homeViewModelPhotoPlural: String { l("homeviewmodel_photo_plural") }
    static var homeViewModelPhotoSingular: String { l("homeviewmodel_photo_singular") }
    static var homeViewModelPlaylistPlural: String { l("homeviewmodel_playlist_plural") }
    static var homeViewModelPlaylistSingular: String { l("homeviewmodel_playlist_singular") }
    static var homeViewModelRecentlyReleased: String { l("homeviewmodel_recently_released") }
    static var homeViewModelSeasonPlural: String { l("homeviewmodel_season_plural") }
    static var homeViewModelSeasonSingular: String { l("homeviewmodel_season_singular") }
    static var homeViewModelSeriesPlural: String { l("homeviewmodel_series_plural") }
    static var homeViewModelSeriesSingular: String { l("homeviewmodel_series_singular") }
    static var homeViewModelTrackPlural: String { l("homeviewmodel_track_plural") }
    static var homeViewModelTrackSingular: String { l("homeviewmodel_track_singular") }
    static func itemDetailsViewAge(_ age: Int) -> String { l("itemdetailsview_age", age) }
    static var itemDetailsViewChapter: String { l("itemdetailsview_chapter") }
    static var itemDetailsViewContinuing: String { l("itemdetailsview_continuing") }
    static var itemDetailsViewDeleteItemTitle: String { l("itemdetailsview_delete_item_title") }
    static var itemDetailsViewDirector: String { l("itemdetailsview_director") }
    static var itemDetailsViewDirectors: String { l("itemdetailsview_directors") }
    static var itemDetailsViewDiscography: String { l("itemdetailsview_discography") }
    static var itemDetailsViewEnded: String { l("itemdetailsview_ended") }
    static var itemDetailsViewMoreFromThisSeason: String { l("itemdetailsview_more_from_this_season") }
    static var itemDetailsViewOneSeason: String { l("itemdetailsview_one_season") }
    static func itemDetailsViewSeasonEpisode(_ s: Int, _ e: Int) -> String { l("itemdetailsview_season_episode", s, e) }
    static func itemDetailsViewSeasonsCount(_ count: Int) -> String { l("itemdetailsview_seasons_count", count) }
    static var itemDetailsViewSpecialFeatures: String { l("itemdetailsview_special_features") }
    static var itemDetailsViewStudio: String { l("itemdetailsview_studio") }
    static var itemDetailsViewTracks: String { l("itemdetailsview_tracks") }
    static var itemDetailsViewWriter: String { l("itemdetailsview_writer") }
    static var itemDetailsViewWriters: String { l("itemdetailsview_writers") }
    static var liveTvGuideViewNow: String { l("livetvguideview_now") }
    static func musicBrowseViewModelAlbumsCount(_ count: Int) -> String { l("musicbrowseviewmodel_albums_count", count) }
    static var musicBrowseViewModelFavoriteAlbums: String { l("musicbrowseviewmodel_favorite_albums") }
    static func musicBrowseViewModelItemsCount(_ count: Int) -> String { l("musicbrowseviewmodel_items_count", count) }
    static var musicBrowseViewModelLatestAudio: String { l("musicbrowseviewmodel_latest_audio") }
    static var nativePlayerWrapperDefault: String { l("nativeplayerwrapper_default") }
    static func nativePlayerWrapperTrackX(_ index: Int) -> String { l("nativeplayerwrapper_track_x", index) }
    static var pauseDescriptionOverlayAlbum: String { l("pausedescriptionoverlay_album") }
    static var pauseDescriptionOverlayAudio: String { l("pausedescriptionoverlay_audio") }
    static var pauseDescriptionOverlayBook: String { l("pausedescriptionoverlay_book") }
    static var pauseDescriptionOverlayEpisode: String { l("pausedescriptionoverlay_episode") }
    static var pauseDescriptionOverlayMedia: String { l("pausedescriptionoverlay_media") }
    static var pauseDescriptionOverlayMovie: String { l("pausedescriptionoverlay_movie") }
    static var pauseDescriptionOverlayPaused: String { l("pausedescriptionoverlay_paused") }
    static var pauseDescriptionOverlayPerson: String { l("pausedescriptionoverlay_person") }
    static var pauseDescriptionOverlaySeason: String { l("pausedescriptionoverlay_season") }
    static var pauseDescriptionOverlayVideo: String { l("pausedescriptionoverlay_video") }
    static var playbackInfoDialogDvRoute: String { l("playbackinfodialog_dv_route") }
    static var playerOverlayViewPlaybackQuality: String { l("playeroverlayview_playback_quality") }
    static var playerOverlayViewQueueNext: String { l("playeroverlayview_queue_next") }
    static var playerOverlayViewSeekBack: String { l("playeroverlayview_seek_back") }
    static var playerOverlayViewSeekForward: String { l("playeroverlayview_seek_forward") }
    static var playerOverlayViewZoomMode: String { l("playeroverlayview_zoom_mode") }
    static var playerViewAlbum: String { l("playerview_album") }
    static var playerViewArtist: String { l("playerview_artist") }
    static var playerViewAudio: String { l("playerview_audio") }
    static var playerViewBook: String { l("playerview_book") }
    static var playerViewCollection: String { l("playerview_collection") }
    static var playerViewEpisode: String { l("playerview_episode") }
    static var playerViewJumpToLiveTv: String { l("playerview_jump_to_live_tv") }
    static var playerViewMedia: String { l("playerview_media") }
    static var playerViewMovie: String { l("playerview_movie") }
    static var playerViewPaused: String { l("playerview_paused") }
    static var playerViewPerson: String { l("playerview_person") }
    static var playerViewPlaylist: String { l("playerview_playlist") }
    static var playerViewSeason: String { l("playerview_season") }
    static var playerViewSeries: String { l("playerview_series") }
    static var playerViewTrailer: String { l("playerview_trailer") }
    static var playerViewVideo: String { l("playerview_video") }
    static func recordingsViewSeriesEpisodeLabel(_ name: String, _ season: Int, _ episode: Int) -> String { l("recordingsview_series_episode_label", name, season, episode) }
    static var rootViewServerMessage: String { l("rootview_server_message") }
    static var searchViewPlaceholder: String { l("searchview_placeholder") }
    static var searchViewTvShow: String { l("searchview_tv_show") }
    static var seerrDiscoverRowViewMovieBadge: String { l("seerrdiscoverrowview_movie_badge") }
    static var seerrDiscoverRowViewSeriesBadge: String { l("seerrdiscoverrowview_series_badge") }
    static var settingsAboutScreenCheckForUpdates: String { l("settingsaboutscreen_check_for_updates") }
    static var settingsAboutScreenCheckForUpdatesCaption: String { l("settingsaboutscreen_check_for_updates_caption") }
    static var settingsAboutScreenDone: String { l("settingsaboutscreen_done") }
    static var settingsAboutScreenJoinDiscord: String { l("settingsaboutscreen_join_discord") }
    static var settingsAboutScreenJoinDiscordCaption: String { l("settingsaboutscreen_join_discord_caption") }
    static var settingsAboutScreenPrivacyPolicy: String { l("settingsaboutscreen_privacy_policy") }
    static var settingsAboutScreenPrivacyPolicyCaption: String { l("settingsaboutscreen_privacy_policy_caption") }
    static var settingsAboutScreenReportAnIssue: String { l("settingsaboutscreen_report_an_issue") }
    static var settingsAboutScreenReportAnIssueCaption: String { l("settingsaboutscreen_report_an_issue_caption") }
    static var settingsAboutScreenSourceCode: String { l("settingsaboutscreen_source_code") }
    static var settingsAboutScreenSourceCodeCaption: String { l("settingsaboutscreen_source_code_caption") }
    static var settingsAboutScreenSupportMoonfin: String { l("settingsaboutscreen_support_moonfin") }
    static var settingsAboutScreenSupportMoonfinCaption: String { l("settingsaboutscreen_support_moonfin_caption") }
    static var settingsAboutScreenTelemetryCaption: String { l("settingsaboutscreen_telemetry_caption") }
    static var settingsAccountSecurityScreenAlwaysAuthenticate: String { l("settingsaccountsecurityscreen_always_authenticate") }
    static var settingsAccountSecurityScreenAlwaysAuthenticateCaption: String { l("settingsaccountsecurityscreen_always_authenticate_caption") }
    static var settingsAccountSecurityScreenAuthenticationCaption: String { l("settingsaccountsecurityscreen_authentication_caption") }
    static var settingsAccountSecurityScreenAutoLogin: String { l("settingsaccountsecurityscreen_auto_login") }
    static var settingsAccountSecurityScreenAutoLoginCaption: String { l("settingsaccountsecurityscreen_auto_login_caption") }
    static var settingsAccountSecurityScreenBlockedRatings: String { l("settingsaccountsecurityscreen_blocked_ratings") }
    static var settingsAccountSecurityScreenBlockedRatingsCaption: String { l("settingsaccountsecurityscreen_blocked_ratings_caption") }
    static var settingsAccountSecurityScreenConfirmExit: String { l("settingsaccountsecurityscreen_confirm_exit") }
    static var settingsAccountSecurityScreenConfirmExitCaption: String { l("settingsaccountsecurityscreen_confirm_exit_caption") }
    static var settingsAccountSecurityScreenPinCode: String { l("settingsaccountsecurityscreen_pin_code") }
    static var settingsAccountSecurityScreenPinCodeCaption: String { l("settingsaccountsecurityscreen_pin_code_caption") }
    static var settingsAccountSecurityScreenSortServersBy: String { l("settingsaccountsecurityscreen_sort_servers_by") }
    static var settingsAccountSecurityScreenSortServersByCaption: String { l("settingsaccountsecurityscreen_sort_servers_by_caption") }
    static var settingsAccountSecurityScreenTitle: String { l("settingsaccountsecurityscreen_title") }
    static func settingsAppearanceSavedThemesScreenDeleteFailedStatus(_ name: String) -> String { l("settingsappearancesavedthemesscreen_delete_failed_status", name) }
    static func settingsAppearanceSavedThemesScreenDeleteMessage(_ name: String) -> String { l("settingsappearancesavedthemesscreen_delete_message", name) }
    static var settingsAppearanceSavedThemesScreenDeleteTitle: String { l("settingsappearancesavedthemesscreen_delete_title") }
    static func settingsAppearanceSavedThemesScreenDeletedStatus(_ name: String) -> String { l("settingsappearancesavedthemesscreen_deleted_status", name) }
    static var settingsAppearanceSavedThemesScreenDescription: String { l("settingsappearancesavedthemesscreen_description") }
    static var settingsAppearanceSavedThemesScreenEmpty: String { l("settingsappearancesavedthemesscreen_empty") }
    static var settingsAppearanceSavedThemesScreenLoading: String { l("settingsappearancesavedthemesscreen_loading") }
    static var settingsAppearanceSavedThemesScreenTitle: String { l("settingsappearancesavedthemesscreen_title") }
    static var settingsAppearanceThemeScreenCustomSubtitle: String { l("settingsappearancethemescreen_custom_subtitle") }
    static var settingsAppearanceThemeScreenDefaultSubtitle: String { l("settingsappearancethemescreen_default_subtitle") }
    static var settingsAppearanceThemeScreenNeonPulse: String { l("settingsappearancethemescreen_neon_pulse") }
    static var settingsAppearanceThemeScreenNeonSubtitle: String { l("settingsappearancethemescreen_neon_subtitle") }
    static var settingsAppearanceThemeScreenTitle: String { l("settingsappearancethemescreen_title") }
    static var settingsAudioPreferencesScreenAc3Passthrough: String { l("settingsaudiopreferencesscreen_ac3_passthrough") }
    static var settingsAudioPreferencesScreenAc3PassthroughCaption: String { l("settingsaudiopreferencesscreen_ac3_passthrough_caption") }
    static var settingsAudioPreferencesScreenAudioBehavior: String { l("settingsaudiopreferencesscreen_audio_behavior") }
    static var settingsAudioPreferencesScreenAudioBehaviorCaption: String { l("settingsaudiopreferencesscreen_audio_behavior_caption") }
    static var settingsAudioPreferencesScreenAudioOutput: String { l("settingsaudiopreferencesscreen_audio_output") }
    static var settingsAudioPreferencesScreenAudioOutputCaption: String { l("settingsaudiopreferencesscreen_audio_output_caption") }
    static var settingsAudioPreferencesScreenDefaultAudioLanguage: String { l("settingsaudiopreferencesscreen_default_audio_language") }
    static var settingsAudioPreferencesScreenDefaultAudioLanguageCaption: String { l("settingsaudiopreferencesscreen_default_audio_language_caption") }
    static var settingsAudioPreferencesScreenNightMode: String { l("settingsaudiopreferencesscreen_night_mode") }
    static var settingsAudioPreferencesScreenNightModeCaption: String { l("settingsaudiopreferencesscreen_night_mode_caption") }
    static var settingsAudioPreferencesScreenTitle: String { l("settingsaudiopreferencesscreen_title") }
    static var settingsAudioPreferencesScreenTrueHdSupport: String { l("settingsaudiopreferencesscreen_truehd_support") }
    static var settingsAudioPreferencesScreenTrueHdSupportCaption: String { l("settingsaudiopreferencesscreen_truehd_support_caption") }
    static var settingsAuthPinCodeScreenChangePin: String { l("settingsauthpincodescreen_change_pin") }
    static var settingsAuthPinCodeScreenNoPinSet: String { l("settingsauthpincodescreen_no_pin_set") }
    static var settingsAuthPinCodeScreenPinCode: String { l("settingsauthpincodescreen_pin_code") }
    static var settingsAuthPinCodeScreenPinCodeEnabled: String { l("settingsauthpincodescreen_pin_code_enabled") }
    static var settingsAuthPinCodeScreenRemovePin: String { l("settingsauthpincodescreen_remove_pin") }
    static var settingsAuthPinCodeScreenRequirePin: String { l("settingsauthpincodescreen_require_pin") }
    static var settingsAuthPinCodeScreenSetPin: String { l("settingsauthpincodescreen_set_pin") }
    static var settingsAuthServerScreenAccounts: String { l("settingsauthserverscreen_accounts") }
    static func settingsAuthServerScreenRemoveConfirm(_ name: String) -> String { l("settingsauthserverscreen_remove_confirm", name) }
    static var settingsAuthServerScreenRemoveServer: String { l("settingsauthserverscreen_remove_server") }
    static var settingsAuthServerScreenServer: String { l("settingsauthserverscreen_server") }
    static var settingsAuthServerUserScreenAccount: String { l("settingsauthserveruserscreen_account") }
    static var settingsAuthServerUserScreenNotSignedIn: String { l("settingsauthserveruserscreen_not_signed_in") }
    static var settingsAuthServerUserScreenRemoveAccount: String { l("settingsauthserveruserscreen_remove_account") }
    static func settingsAuthServerUserScreenRemoveUserFromDevice(_ name: String) -> String { l("settingsauthserveruserscreen_remove_user_from_device", name) }
    static var settingsAuthServerUserScreenSignOut: String { l("settingsauthserveruserscreen_sign_out") }
    static var settingsAuthServerUserScreenSignedIn: String { l("settingsauthserveruserscreen_signed_in") }
    static var settingsAuthenticationAutoSignInScreenDisabledCaption: String { l("settingsauthenticationautosigninscreen_disabled_caption") }
    static var settingsAuthenticationAutoSignInScreenLastUserCaption: String { l("settingsauthenticationautosigninscreen_last_user_caption") }
    static var settingsAuthenticationAutoSignInScreenTitle: String { l("settingsauthenticationautosigninscreen_title") }
    static var settingsAuthenticationScreenAlwaysAuthenticate: String { l("settingsauthenticationscreen_always_authenticate") }
    static var settingsAuthenticationScreenAlwaysAuthenticateCaption: String { l("settingsauthenticationscreen_always_authenticate_caption") }
    static var settingsAuthenticationScreenAutoSignIn: String { l("settingsauthenticationscreen_auto_sign_in") }
    static var settingsAuthenticationScreenAutoSignInCaption: String { l("settingsauthenticationscreen_auto_sign_in_caption") }
    static var settingsAuthenticationScreenOrderOfServers: String { l("settingsauthenticationscreen_order_of_servers") }
    static var settingsAuthenticationScreenServers: String { l("settingsauthenticationscreen_servers") }
    static var settingsAuthenticationScreenSortServersBy: String { l("settingsauthenticationscreen_sort_servers_by") }
    static var settingsAutomationQueueScreenCinemaMode: String { l("settingsautomationqueuescreen_cinema_mode") }
    static var settingsAutomationQueueScreenCinemaModeCaption: String { l("settingsautomationqueuescreen_cinema_mode_caption") }
    static var settingsAutomationQueueScreenMediaQueuing: String { l("settingsautomationqueuescreen_media_queuing") }
    static var settingsAutomationQueueScreenMediaQueuingCaption: String { l("settingsautomationqueuescreen_media_queuing_caption") }
    static var settingsAutomationQueueScreenNextUpDisplay: String { l("settingsautomationqueuescreen_next_up_display") }
    static var settingsAutomationQueueScreenNextUpDisplayCaption: String { l("settingsautomationqueuescreen_next_up_display_caption") }
    static var settingsAutomationQueueScreenNextUpTimeout: String { l("settingsautomationqueuescreen_next_up_timeout") }
    static var settingsAutomationQueueScreenNextUpTimeoutCaption: String { l("settingsautomationqueuescreen_next_up_timeout_caption") }
    static var settingsAutomationQueueScreenStillWatchingPrompt: String { l("settingsautomationqueuescreen_still_watching_prompt") }
    static var settingsAutomationQueueScreenStillWatchingPromptCaption: String { l("settingsautomationqueuescreen_still_watching_prompt_caption") }
    static var settingsAutomationQueueScreenTitle: String { l("settingsautomationqueuescreen_title") }
    static var settingsCustomizationScreenAppearanceTheme: String { l("settingscustomizationscreen_appearance_theme") }
    static var settingsCustomizationScreenAppearanceThemeCaption: String { l("settingscustomizationscreen_appearance_theme_caption") }
    static var settingsCustomizationScreenClock: String { l("settingscustomizationscreen_clock") }
    static var settingsCustomizationScreenClockCaption: String { l("settingscustomizationscreen_clock_caption") }
    static var settingsCustomizationScreenFocusBorderColor: String { l("settingscustomizationscreen_focus_border_color") }
    static var settingsCustomizationScreenFocusBorderColorCaption: String { l("settingscustomizationscreen_focus_border_color_caption") }
    static var settingsCustomizationScreenLibrariesCaption: String { l("settingscustomizationscreen_libraries_caption") }
    static var settingsCustomizationScreenSubtitlesCaption: String { l("settingscustomizationscreen_subtitles_caption") }
    static var settingsCustomizationScreenWatchedIndicator: String { l("settingscustomizationscreen_watched_indicator") }
    static var settingsCustomizationScreenWatchedIndicatorCaption: String { l("settingscustomizationscreen_watched_indicator_caption") }
    static var settingsDynamicContentScreenLocalPreviews: String { l("settingsdynamiccontentscreen_local_previews") }
    static var settingsDynamicContentScreenLocalPreviewsCaption: String { l("settingsdynamiccontentscreen_local_previews_caption") }
    static var settingsDynamicContentScreenMediaBar: String { l("settingsdynamiccontentscreen_media_bar") }
    static var settingsDynamicContentScreenMediaBarCaption: String { l("settingsdynamiccontentscreen_media_bar_caption") }
    static var settingsDynamicContentScreenSeasonalEffects: String { l("settingsdynamiccontentscreen_seasonal_effects") }
    static var settingsDynamicContentScreenSeasonalEffectsCaption: String { l("settingsdynamiccontentscreen_seasonal_effects_caption") }
    static var settingsDynamicContentScreenTitle: String { l("settingsdynamiccontentscreen_title") }
    static var settingsDynamicContentSubScreensLocalPreviews: String { l("settingsdynamiccontentsubscreens_local_previews") }
    static var settingsDynamicContentSubScreensMediaPreview: String { l("settingsdynamiccontentsubscreens_media_preview") }
    static var settingsDynamicContentSubScreensMediaPreviewCaption: String { l("settingsdynamiccontentsubscreens_media_preview_caption") }
    static var settingsDynamicContentSubScreensPreviewAudio: String { l("settingsdynamiccontentsubscreens_preview_audio") }
    static var settingsDynamicContentSubScreensPreviewAudioCaption: String { l("settingsdynamiccontentsubscreens_preview_audio_caption") }
    static var settingsDynamicContentSubScreensSeasonalEffects: String { l("settingsdynamiccontentsubscreens_seasonal_effects") }
    static var settingsDynamicContentSubScreensSeasonalSurprise: String { l("settingsdynamiccontentsubscreens_seasonal_surprise") }
    static var settingsDynamicContentSubScreensSeasonalSurpriseCaption: String { l("settingsdynamiccontentsubscreens_seasonal_surprise_caption") }
    static var settingsDynamicContentSubScreensTrailerPreview: String { l("settingsdynamiccontentsubscreens_trailer_preview") }
    static var settingsDynamicContentSubScreensTrailerPreviewCaption: String { l("settingsdynamiccontentsubscreens_trailer_preview_caption") }
    static var settingsGeneralStyleScreen24HourClock: String { l("settingsgeneralstylescreen_24_hour_clock") }
    static var settingsGeneralStyleScreen24HourClockCaption: String { l("settingsgeneralstylescreen_24_hour_clock_caption") }
    static var settingsGeneralStyleScreenAppearanceTheme: String { l("settingsgeneralstylescreen_appearance_theme") }
    static var settingsGeneralStyleScreenAppearanceThemeCaption: String { l("settingsgeneralstylescreen_appearance_theme_caption") }
    static var settingsGeneralStyleScreenBackgroundBackdrops: String { l("settingsgeneralstylescreen_background_backdrops") }
    static var settingsGeneralStyleScreenBackgroundBackdropsCaption: String { l("settingsgeneralstylescreen_background_backdrops_caption") }
    static var settingsGeneralStyleScreenBrowsingBlur: String { l("settingsgeneralstylescreen_browsing_blur") }
    static var settingsGeneralStyleScreenBrowsingBlurCaption: String { l("settingsgeneralstylescreen_browsing_blur_caption") }
    static var settingsGeneralStyleScreenClockDisplay: String { l("settingsgeneralstylescreen_clock_display") }
    static var settingsGeneralStyleScreenClockDisplayCaption: String { l("settingsgeneralstylescreen_clock_display_caption") }
    static var settingsGeneralStyleScreenDetailsBlur: String { l("settingsgeneralstylescreen_details_blur") }
    static var settingsGeneralStyleScreenDetailsBlurCaption: String { l("settingsgeneralstylescreen_details_blur_caption") }
    static var settingsGeneralStyleScreenFocusBorderColor: String { l("settingsgeneralstylescreen_focus_border_color") }
    static var settingsGeneralStyleScreenFocusBorderColorCaption: String { l("settingsgeneralstylescreen_focus_border_color_caption") }
    static var settingsGeneralStyleScreenFocusExpansion: String { l("settingsgeneralstylescreen_focus_expansion") }
    static var settingsGeneralStyleScreenFocusExpansionCaption: String { l("settingsgeneralstylescreen_focus_expansion_caption") }
    static var settingsGeneralStyleScreenSavedThemes: String { l("settingsgeneralstylescreen_saved_themes") }
    static var settingsGeneralStyleScreenSavedThemesCaption: String { l("settingsgeneralstylescreen_saved_themes_caption") }
    static var settingsGeneralStyleScreenThemeMusic: String { l("settingsgeneralstylescreen_theme_music") }
    static var settingsGeneralStyleScreenThemeMusicCaption: String { l("settingsgeneralstylescreen_theme_music_caption") }
    static var settingsGeneralStyleScreenThemeMusicVolume: String { l("settingsgeneralstylescreen_theme_music_volume") }
    static var settingsGeneralStyleScreenThemeMusicVolumeCaption: String { l("settingsgeneralstylescreen_theme_music_volume_caption") }
    static var settingsGeneralStyleScreenTitle: String { l("settingsgeneralstylescreen_title") }
    static var settingsGeneralStyleScreenWatchedIndicators: String { l("settingsgeneralstylescreen_watched_indicators") }
    static var settingsGeneralStyleScreenWatchedIndicatorsCaption: String { l("settingsgeneralstylescreen_watched_indicators_caption") }
    static var settingsHomeImageTypeScreenContinueWatching: String { l("settingshomeimagetypescreen_continue_watching") }
    static var settingsHomeImageTypeScreenContinueWatchingCaption: String { l("settingshomeimagetypescreen_continue_watching_caption") }
    static var settingsHomeImageTypeScreenLibrariesCaption: String { l("settingshomeimagetypescreen_libraries_caption") }
    static var settingsHomeImageTypeScreenLiveTvCaption: String { l("settingshomeimagetypescreen_live_tv_caption") }
    static var settingsHomeImageTypeScreenMyMedia: String { l("settingshomeimagetypescreen_my_media") }
    static var settingsHomeImageTypeScreenMyMediaCaption: String { l("settingshomeimagetypescreen_my_media_caption") }
    static var settingsHomeImageTypeScreenNextUp: String { l("settingshomeimagetypescreen_next_up") }
    static var settingsHomeImageTypeScreenNextUpCaption: String { l("settingshomeimagetypescreen_next_up_caption") }
    static var settingsHomeScreenCollectionsRowSorting: String { l("settingshomescreen_collections_row_sorting") }
    static var settingsHomeScreenCollectionsRowSortingCaption: String { l("settingshomescreen_collections_row_sorting_caption") }
    static var settingsHomeScreenDisplayCollectionsRows: String { l("settingshomescreen_display_collections_rows") }
    static var settingsHomeScreenDisplayCollectionsRowsCaption: String { l("settingshomescreen_display_collections_rows_caption") }
    static var settingsHomeScreenDisplayFavoritesRows: String { l("settingshomescreen_display_favorites_rows") }
    static var settingsHomeScreenDisplayFavoritesRowsCaption: String { l("settingshomescreen_display_favorites_rows_caption") }
    static var settingsHomeScreenDisplayGenresRows: String { l("settingshomescreen_display_genres_rows") }
    static var settingsHomeScreenDisplayGenresRowsCaption: String { l("settingshomescreen_display_genres_rows_caption") }
    static var settingsHomeScreenFavoritesRowSorting: String { l("settingshomescreen_favorites_row_sorting") }
    static var settingsHomeScreenFavoritesRowSortingCaption: String { l("settingshomescreen_favorites_row_sorting_caption") }
    static var settingsHomeScreenGenresRowItems: String { l("settingshomescreen_genres_row_items") }
    static var settingsHomeScreenGenresRowItemsCaption: String { l("settingshomescreen_genres_row_items_caption") }
    static var settingsHomeScreenGenresRowSorting: String { l("settingshomescreen_genres_row_sorting") }
    static var settingsHomeScreenGenresRowSortingCaption: String { l("settingshomescreen_genres_row_sorting_caption") }
    static var settingsHomeScreenHomeRowStyle: String { l("settingshomescreen_home_row_style") }
    static var settingsHomeScreenHomeRowStyleCaption: String { l("settingshomescreen_home_row_style_caption") }
    static var settingsHomeScreenHomeSections: String { l("settingshomescreen_home_sections") }
    static var settingsHomeScreenHomeSectionsCaption: String { l("settingshomescreen_home_sections_caption") }
    static var settingsHomeScreenInfoOverlay: String { l("settingshomescreen_info_overlay") }
    static var settingsHomeScreenInfoOverlayCaption: String { l("settingshomescreen_info_overlay_caption") }
    static var settingsHomeScreenMergeContinueNextUp: String { l("settingshomescreen_merge_continue_next_up") }
    static var settingsHomeScreenMergeContinueNextUpCaption: String { l("settingshomescreen_merge_continue_next_up_caption") }
    static var settingsHomeScreenPerRowImageType: String { l("settingshomescreen_per_row_image_type") }
    static var settingsHomeScreenPerRowImageTypeCaption: String { l("settingshomescreen_per_row_image_type_caption") }
    static var settingsHomeScreenPosterSize: String { l("settingshomescreen_poster_size") }
    static var settingsHomeScreenPosterSizeCaption: String { l("settingshomescreen_poster_size_caption") }
    static var settingsHomeScreenSeriesThumbnails: String { l("settingshomescreen_series_thumbnails") }
    static var settingsHomeScreenSeriesThumbnailsCaption: String { l("settingshomescreen_series_thumbnails_caption") }
    static var settingsHomeScreenThemeMusicOnHomeRows: String { l("settingshomescreen_theme_music_on_home_rows") }
    static var settingsHomeScreenThemeMusicOnHomeRowsCaption: String { l("settingshomescreen_theme_music_on_home_rows_caption") }
    static var settingsHomeScreenTitle: String { l("settingshomescreen_title") }
    static var settingsHomeSectionsScreenDynamicRow: String { l("settingshomesectionsscreen_dynamic_row") }
    static var settingsHomeSectionsScreenReorderHint: String { l("settingshomesectionsscreen_reorder_hint") }
    static var settingsHomeSectionsScreenResetToDefaults: String { l("settingshomesectionsscreen_reset_to_defaults") }
    static var settingsHomeSectionsScreenRowConfiguration: String { l("settingshomesectionsscreen_row_configuration") }
    static var settingsHomeSectionsScreenTitle: String { l("settingshomesectionsscreen_title") }
    static var settingsIntegrationsScreenActiveServer: String { l("settingsintegrationsscreen_active_server") }
    static var settingsIntegrationsScreenDiscoveredSections: String { l("settingsintegrationsscreen_discovered_sections") }
    static var settingsIntegrationsScreenDiscoveredSectionsCaption: String { l("settingsintegrationsscreen_discovered_sections_caption") }
    static var settingsIntegrationsScreenHomeScreenSections: String { l("settingsintegrationsscreen_home_screen_sections") }
    static var settingsIntegrationsScreenHomeScreenSectionsCaption: String { l("settingsintegrationsscreen_home_screen_sections_caption") }
    static var settingsIntegrationsScreenInstalledDisabled: String { l("settingsintegrationsscreen_installed_disabled") }
    static var settingsIntegrationsScreenInstalledEnabled: String { l("settingsintegrationsscreen_installed_enabled") }
    static var settingsIntegrationsScreenLastError: String { l("settingsintegrationsscreen_last_error") }
    static var settingsIntegrationsScreenLastErrorCaption: String { l("settingsintegrationsscreen_last_error_caption") }
    static var settingsIntegrationsScreenLastUpdated: String { l("settingsintegrationsscreen_last_updated") }
    static var settingsIntegrationsScreenLastUpdatedCaption: String { l("settingsintegrationsscreen_last_updated_caption") }
    static var settingsIntegrationsScreenManageHomeSections: String { l("settingsintegrationsscreen_manage_home_sections") }
    static var settingsIntegrationsScreenManageHomeSectionsCaption: String { l("settingsintegrationsscreen_manage_home_sections_caption") }
    static var settingsIntegrationsScreenMetadataAndRatings: String { l("settingsintegrationsscreen_metadata_and_ratings") }
    static var settingsIntegrationsScreenMetadataAndRatingsCaption: String { l("settingsintegrationsscreen_metadata_and_ratings_caption") }
    static var settingsIntegrationsScreenNotConnected: String { l("settingsintegrationsscreen_not_connected") }
    static var settingsIntegrationsScreenNotInstalled: String { l("settingsintegrationsscreen_not_installed") }
    static var settingsIntegrationsScreenPluginCaption: String { l("settingsintegrationsscreen_plugin_caption") }
    static var settingsIntegrationsScreenPluginStatus: String { l("settingsintegrationsscreen_plugin_status") }
    static var settingsIntegrationsScreenPluginStatusCaption: String { l("settingsintegrationsscreen_plugin_status_caption") }
    static var settingsIntegrationsScreenPluginVersion: String { l("settingsintegrationsscreen_plugin_version") }
    static var settingsIntegrationsScreenPluginVersionCaption: String { l("settingsintegrationsscreen_plugin_version_caption") }
    static var settingsIntegrationsScreenRefreshStatus: String { l("settingsintegrationsscreen_refresh_status") }
    static var settingsIntegrationsScreenRefreshStatusCaption: String { l("settingsintegrationsscreen_refresh_status_caption") }
    static var settingsIntegrationsScreenSeerrCaption: String { l("settingsintegrationsscreen_seerr_caption") }
    static var settingsIntegrationsScreenStatusRefreshed: String { l("settingsintegrationsscreen_status_refreshed") }
    static var settingsLanguageScreenLanguage: String { l("settingslanguagescreen_language") }
    static var settingsLibrariesScreenEnableFolderView: String { l("settingslibrariesscreen_enable_folder_view") }
    static var settingsLibrariesScreenEnableFolderViewCaption: String { l("settingslibrariesscreen_enable_folder_view_caption") }
    static var settingsLibrariesScreenMultiServerLibraries: String { l("settingslibrariesscreen_multi_server_libraries") }
    static var settingsLibrariesScreenMultiServerLibrariesCaption: String { l("settingslibrariesscreen_multi_server_libraries_caption") }
    static var settingsLibraryDisplayScreenGridDirection: String { l("settingslibrarydisplayscreen_grid_direction") }
    static var settingsLibraryDisplayScreenGridDirectionCaption: String { l("settingslibrarydisplayscreen_grid_direction_caption") }
    static var settingsLibraryDisplayScreenHideFromHome: String { l("settingslibrarydisplayscreen_hide_from_home") }
    static var settingsLibraryDisplayScreenHideFromHomeCaption: String { l("settingslibrarydisplayscreen_hide_from_home_caption") }
    static var settingsLibraryDisplayScreenImageSize: String { l("settingslibrarydisplayscreen_image_size") }
    static var settingsLibraryDisplayScreenImageSizeCaption: String { l("settingslibrarydisplayscreen_image_size_caption") }
    static var settingsLibraryDisplayScreenImageTypeCaption: String { l("settingslibrarydisplayscreen_image_type_caption") }
    static var settingsLiveTvGuideFiltersScreenPremieresOnly: String { l("settingslivetvguidefiltersscreen_premieres_only") }
    static var settingsLiveTvGuideFiltersScreenShowKids: String { l("settingslivetvguidefiltersscreen_show_kids") }
    static var settingsLiveTvGuideFiltersScreenShowMovies: String { l("settingslivetvguidefiltersscreen_show_movies") }
    static var settingsLiveTvGuideFiltersScreenShowNews: String { l("settingslivetvguidefiltersscreen_show_news") }
    static var settingsLiveTvGuideFiltersScreenShowPremieres: String { l("settingslivetvguidefiltersscreen_show_premieres") }
    static var settingsLiveTvGuideFiltersScreenShowSeries: String { l("settingslivetvguidefiltersscreen_show_series") }
    static var settingsLiveTvGuideFiltersScreenShowSports: String { l("settingslivetvguidefiltersscreen_show_sports") }
    static var settingsMainScreenAboutCaption: String { l("settingsmainscreen_about_caption") }
    static var settingsMainScreenAccountAndSecurity: String { l("settingsmainscreen_account_and_security") }
    static var settingsMainScreenAccountAndSecurityCaption: String { l("settingsmainscreen_account_and_security_caption") }
    static var settingsMainScreenDynamicContent: String { l("settingsmainscreen_dynamic_content") }
    static var settingsMainScreenDynamicContentCaption: String { l("settingsmainscreen_dynamic_content_caption") }
    static var settingsMainScreenIntegrationsCaption: String { l("settingsmainscreen_integrations_caption") }
    static var settingsMainScreenPersonalization: String { l("settingsmainscreen_personalization") }
    static var settingsMainScreenPersonalizationCaption: String { l("settingsmainscreen_personalization_caption") }
    static var settingsMainScreenPlaybackAndSyncPlay: String { l("settingsmainscreen_playback_and_syncplay") }
    static var settingsMainScreenPlaybackAndSyncPlayCaption: String { l("settingsmainscreen_playback_and_syncplay_caption") }
    static var settingsMaxBitrateScreen042Mbps: String { l("settingsmaxbitratescreen_0_42_mbps") }
    static var settingsMaxBitrateScreen07Mbps360p: String { l("settingsmaxbitratescreen_0_7_mbps_360p") }
    static var settingsMaxBitrateScreen10Mbps720p: String { l("settingsmaxbitratescreen_10_mbps_720p") }
    static var settingsMaxBitrateScreen120Mbps4kHigh: String { l("settingsmaxbitratescreen_120_mbps_4k_high") }
    static var settingsMaxBitrateScreen15Mbps: String { l("settingsmaxbitratescreen_1_5_mbps") }
    static var settingsMaxBitrateScreen15Mbps1080p: String { l("settingsmaxbitratescreen_15_mbps_1080p") }
    static var settingsMaxBitrateScreen1Mbps: String { l("settingsmaxbitratescreen_1_mbps") }
    static var settingsMaxBitrateScreen20Mbps1080p: String { l("settingsmaxbitratescreen_20_mbps_1080p") }
    static var settingsMaxBitrateScreen2Mbps480p: String { l("settingsmaxbitratescreen_2_mbps_480p") }
    static var settingsMaxBitrateScreen3Mbps: String { l("settingsmaxbitratescreen_3_mbps") }
    static var settingsMaxBitrateScreen40Mbps1080pHigh: String { l("settingsmaxbitratescreen_40_mbps_1080p_high") }
    static var settingsMaxBitrateScreen4Mbps: String { l("settingsmaxbitratescreen_4_mbps") }
    static var settingsMaxBitrateScreen60Mbps4k: String { l("settingsmaxbitratescreen_60_mbps_4k") }
    static var settingsMaxBitrateScreen6Mbps: String { l("settingsmaxbitratescreen_6_mbps") }
    static var settingsMaxBitrateScreen80Mbps4k: String { l("settingsmaxbitratescreen_80_mbps_4k") }
    static var settingsMaxBitrateScreen8Mbps720p: String { l("settingsmaxbitratescreen_8_mbps_720p") }
    static var settingsMaxBitrateScreenMaxBitrate: String { l("settingsmaxbitratescreen_max_bitrate") }
    static var settingsMediaBarOpacityScreenTitle: String { l("settingsmediabaropacityscreen_title") }
    static var settingsMediaBarSourceSelectionScreensExcludedGenres: String { l("settingsmediabarsourceselectionscreens_excluded_genres") }
    static var settingsMediaBarSourceSelectionScreensNoCollections: String { l("settingsmediabarsourceselectionscreens_no_collections") }
    static var settingsMediaBarSourceSelectionScreensNoGenres: String { l("settingsmediabarsourceselectionscreens_no_genres") }
    static var settingsMediaBarSourceSelectionScreensSourceCollections: String { l("settingsmediabarsourceselectionscreens_source_collections") }
    static var settingsMediaBarSourceSelectionScreensSourceLibraries: String { l("settingsmediabarsourceselectionscreens_source_libraries") }
    static var settingsMediaSegmentsScreenTitle: String { l("settingsmediasegmentsscreen_title") }
    static var settingsMetadataRatingsScreenAdditionalRatings: String { l("settingsmetadataratingsscreen_additional_ratings") }
    static var settingsMetadataRatingsScreenAdditionalRatingsCaption: String { l("settingsmetadataratingsscreen_additional_ratings_caption") }
    static var settingsMetadataRatingsScreenEpisodeRatings: String { l("settingsmetadataratingsscreen_episode_ratings") }
    static var settingsMetadataRatingsScreenEpisodeRatingsCaption: String { l("settingsmetadataratingsscreen_episode_ratings_caption") }
    static var settingsMetadataRatingsScreenMetadataAndRatings: String { l("settingsmetadataratingsscreen_metadata_and_ratings") }
    static var settingsMetadataRatingsScreenPressToRearrange: String { l("settingsmetadataratingsscreen_press_to_rearrange") }
    static var settingsMetadataRatingsScreenRatingBadges: String { l("settingsmetadataratingsscreen_rating_badges") }
    static var settingsMetadataRatingsScreenRatingBadgesCaption: String { l("settingsmetadataratingsscreen_rating_badges_caption") }
    static var settingsMetadataRatingsScreenRatingLabels: String { l("settingsmetadataratingsscreen_rating_labels") }
    static var settingsMetadataRatingsScreenRatingLabelsCaption: String { l("settingsmetadataratingsscreen_rating_labels_caption") }
    static var settingsMetadataRatingsScreenRatingSources: String { l("settingsmetadataratingsscreen_rating_sources") }
    static var settingsMetadataRatingsScreenRatingSourcesCaption: String { l("settingsmetadataratingsscreen_rating_sources_caption") }
    static var settingsMoonfinScreenCustomizationProfile: String { l("settingsmoonfinscreen_customization_profile") }
    static var settingsMoonfinScreenCustomizationProfileCaption: String { l("settingsmoonfinscreen_customization_profile_caption") }
    static var settingsMoonfinScreenLoadProfile: String { l("settingsmoonfinscreen_load_profile") }
    static var settingsMoonfinScreenLoadProfileCaption: String { l("settingsmoonfinscreen_load_profile_caption") }
    static var settingsMoonfinScreenProfileLoaded: String { l("settingsmoonfinscreen_profile_loaded") }
    static var settingsMoonfinScreenProfileSaved: String { l("settingsmoonfinscreen_profile_saved") }
    static var settingsMoonfinScreenSaveProfile: String { l("settingsmoonfinscreen_save_profile") }
    static var settingsMoonfinScreenSaveProfileCaption: String { l("settingsmoonfinscreen_save_profile_caption") }
    static var settingsMoonfinScreenServerPluginSync: String { l("settingsmoonfinscreen_server_plugin_sync") }
    static var settingsMoonfinScreenServerPluginSyncCaption: String { l("settingsmoonfinscreen_server_plugin_sync_caption") }
    static var settingsMoonfinScreenTitle: String { l("settingsmoonfinscreen_title") }
    static var settingsNavigationScreenChooseNavbarColor: String { l("settingsnavigationscreen_choose_navbar_color") }
    static var settingsNavigationScreenChooseTopOrLeftNavigation: String { l("settingsnavigationscreen_choose_top_or_left_navigation") }
    static var settingsNavigationScreenDisplayTheFavoritesShortcut: String { l("settingsnavigationscreen_display_the_favorites_shortcut") }
    static var settingsNavigationScreenDisplayTheGenresShortcut: String { l("settingsnavigationscreen_display_the_genres_shortcut") }
    static var settingsNavigationScreenDisplayTheLibrariesShortcut: String { l("settingsnavigationscreen_display_the_libraries_shortcut") }
    static var settingsNavigationScreenDisplayTheShuffleShortcut: String { l("settingsnavigationscreen_display_the_shuffle_shortcut") }
    static var settingsNavigationScreenNavbarColor: String { l("settingsnavigationscreen_navbar_color") }
    static var settingsNavigationScreenNavbarOpacity: String { l("settingsnavigationscreen_navbar_opacity") }
    static var settingsNavigationScreenNavigation: String { l("settingsnavigationscreen_navigation") }
    static var settingsNavigationScreenNavigationStyle: String { l("settingsnavigationscreen_navigation_style") }
    static var settingsNavigationScreenRestrictShuffleToAContentType: String { l("settingsnavigationscreen_restrict_shuffle_to_a_content_type") }
    static var settingsNavigationScreenSetNavbarOpacityPercentage: String { l("settingsnavigationscreen_set_navbar_opacity_percentage") }
    static var settingsNavigationScreenShowFavoritesButton: String { l("settingsnavigationscreen_show_favorites_button") }
    static var settingsNavigationScreenShowGenresButton: String { l("settingsnavigationscreen_show_genres_button") }
    static var settingsNavigationScreenShowLibrariesInToolbar: String { l("settingsnavigationscreen_show_libraries_in_toolbar") }
    static var settingsNavigationScreenShowShuffleButton: String { l("settingsnavigationscreen_show_shuffle_button") }
    static var settingsNavigationScreenShuffleContentTypeFilter: String { l("settingsnavigationscreen_shuffle_content_type_filter") }
    static var settingsOverlayViewBackgroundColor: String { l("settingsoverlayview_background_color") }
    static var settingsOverlayViewBrowsingBackgroundBlur: String { l("settingsoverlayview_browsing_background_blur") }
    static var settingsOverlayViewClock: String { l("settingsoverlayview_clock") }
    static var settingsOverlayViewCollectionsRowSorting: String { l("settingsoverlayview_collections_row_sorting") }
    static var settingsOverlayViewContinueWatching: String { l("settingsoverlayview_continue_watching") }
    static var settingsOverlayViewCustomizationProfile: String { l("settingsoverlayview_customization_profile") }
    static var settingsOverlayViewDefaultAudioLanguage: String { l("settingsoverlayview_default_audio_language") }
    static var settingsOverlayViewDetailsBackgroundBlur: String { l("settingsoverlayview_details_background_blur") }
    static var settingsOverlayViewEdgeColor: String { l("settingsoverlayview_edge_color") }
    static var settingsOverlayViewFavoritesRowSorting: String { l("settingsoverlayview_favorites_row_sorting") }
    static var settingsOverlayViewFocusBorderColor: String { l("settingsoverlayview_focus_border_color") }
    static var settingsOverlayViewGenresRowItems: String { l("settingsoverlayview_genres_row_items") }
    static var settingsOverlayViewGenresRowSorting: String { l("settingsoverlayview_genres_row_sorting") }
    static var settingsOverlayViewGridDirection: String { l("settingsoverlayview_grid_direction") }
    static var settingsOverlayViewHomeRowStyle: String { l("settingsoverlayview_home_row_style") }
    static var settingsOverlayViewImageSize: String { l("settingsoverlayview_image_size") }
    static var settingsOverlayViewMediaBarAutoAdvanceInterval: String { l("settingsoverlayview_media_bar_auto_advance_interval") }
    static var settingsOverlayViewMediaBarColor: String { l("settingsoverlayview_media_bar_color") }
    static var settingsOverlayViewMediaBarContent: String { l("settingsoverlayview_media_bar_content") }
    static var settingsOverlayViewMediaBarItems: String { l("settingsoverlayview_media_bar_items") }
    static var settingsOverlayViewMediaBarMode: String { l("settingsoverlayview_media_bar_mode") }
    static var settingsOverlayViewMyMedia: String { l("settingsoverlayview_my_media") }
    static var settingsOverlayViewNavbarColor: String { l("settingsoverlayview_navbar_color") }
    static var settingsOverlayViewNavbarOpacity: String { l("settingsoverlayview_navbar_opacity") }
    static var settingsOverlayViewNavbarPosition: String { l("settingsoverlayview_navbar_position") }
    static var settingsOverlayViewNextUp: String { l("settingsoverlayview_next_up") }
    static var settingsOverlayViewPlaybackQuality: String { l("settingsoverlayview_playback_quality") }
    static var settingsOverlayViewRefreshRateSwitching: String { l("settingsoverlayview_refresh_rate_switching") }
    static var settingsOverlayViewScreensaverMode: String { l("settingsoverlayview_screensaver_mode") }
    static var settingsOverlayViewSeasonalSurprise: String { l("settingsoverlayview_seasonal_surprise") }
    static var settingsOverlayViewShuffleContentType: String { l("settingsoverlayview_shuffle_content_type") }
    static var settingsOverlayViewSkipBackLength: String { l("settingsoverlayview_skip_back_length") }
    static var settingsOverlayViewSortServersBy: String { l("settingsoverlayview_sort_servers_by") }
    static var settingsOverlayViewTextColor: String { l("settingsoverlayview_text_color") }
    static var settingsOverlayViewThemeMusicVolume: String { l("settingsoverlayview_theme_music_volume") }
    static var settingsOverlayViewWatchedIndicator: String { l("settingsoverlayview_watched_indicator") }
    static var settingsParentalControlsScreenNoRatings: String { l("settingsparentalcontrolsscreen_no_ratings") }
    static var settingsParentalControlsScreenRetryCaption: String { l("settingsparentalcontrolsscreen_retry_caption") }
    static var settingsParentalControlsScreenRetryFetch: String { l("settingsparentalcontrolsscreen_retry_fetch") }
    static var settingsPersonalizationScreenGeneralStyle: String { l("settingspersonalizationscreen_general_style") }
    static var settingsPersonalizationScreenGeneralStyleCaption: String { l("settingspersonalizationscreen_general_style_caption") }
    static var settingsPersonalizationScreenHomeScreen: String { l("settingspersonalizationscreen_home_screen") }
    static var settingsPersonalizationScreenHomeScreenCaption: String { l("settingspersonalizationscreen_home_screen_caption") }
    static var settingsPersonalizationScreenLibraries: String { l("settingspersonalizationscreen_libraries") }
    static var settingsPersonalizationScreenLibrariesCaption: String { l("settingspersonalizationscreen_libraries_caption") }
    static var settingsPersonalizationScreenNavigation: String { l("settingspersonalizationscreen_navigation") }
    static var settingsPersonalizationScreenNavigationCaption: String { l("settingspersonalizationscreen_navigation_caption") }
    static var settingsPersonalizationScreenScreensaverCaption: String { l("settingspersonalizationscreen_screensaver_caption") }
    static var settingsPersonalizationScreenTitle: String { l("settingspersonalizationscreen_title") }
    static var settingsPlaybackAdvancedScreenAdvancedPlayback: String { l("settingsplaybackadvancedscreen_advanced_playback") }
    static var settingsPlaybackAdvancedScreenAudioControlsHint: String { l("settingsplaybackadvancedscreen_audio_controls_hint") }
    static var settingsPlaybackAdvancedScreenCompatibilityProfile: String { l("settingsplaybackadvancedscreen_compatibility_profile") }
    static var settingsPlaybackAdvancedScreenDelayBeforePlayback: String { l("settingsplaybackadvancedscreen_delay_before_playback") }
    static var settingsPlaybackAdvancedScreenDirectPlay: String { l("settingsplaybackadvancedscreen_direct_play") }
    static func settingsPlaybackAdvancedScreenMilliseconds(_ value: Int) -> String { l("settingsplaybackadvancedscreen_milliseconds", value) }
    static var settingsPlaybackAdvancedScreenPlayLiveStreams: String { l("settingsplaybackadvancedscreen_play_live_streams") }
    static var settingsPlaybackAdvancedScreenPlaybackQuality: String { l("settingsplaybackadvancedscreen_playback_quality") }
    static var settingsPlaybackAdvancedScreenVideoStartDelay: String { l("settingsplaybackadvancedscreen_video_start_delay") }
    static func settingsPlaybackScreenBitrateMbps(_ mbps: Int) -> String { l("settingsplaybackscreen_bitrate_mbps", mbps) }
    static var settingsPlaybackScreenChooseActionBehavior: String { l("settingsplaybackscreen_choose_action_behavior") }
    static var settingsPlaybackScreenHardwareDecoding: String { l("settingsplaybackscreen_hardware_decoding") }
    static var settingsPlaybackScreenHardwareDecodingCaption: String { l("settingsplaybackscreen_hardware_decoding_caption") }
    static var settingsPlaybackScreenMaxResolution: String { l("settingsplaybackscreen_max_resolution") }
    static var settingsPlaybackScreenMaxResolutionCaption: String { l("settingsplaybackscreen_max_resolution_caption") }
    static var settingsPlaybackScreenMaxStreamingBitrate: String { l("settingsplaybackscreen_max_streaming_bitrate") }
    static var settingsPlaybackScreenMaxStreamingBitrateCaption: String { l("settingsplaybackscreen_max_streaming_bitrate_caption") }
    static var settingsPlaybackScreenNotAvailableOnServer: String { l("settingsplaybackscreen_not_available_on_server") }
    static var settingsPlaybackScreenPlayerZoomMode: String { l("settingsplaybackscreen_player_zoom_mode") }
    static var settingsPlaybackScreenPlayerZoomModeCaption: String { l("settingsplaybackscreen_player_zoom_mode_caption") }
    static var settingsPlaybackScreenRefreshRateSwitching: String { l("settingsplaybackscreen_refresh_rate_switching") }
    static var settingsPlaybackScreenRefreshRateSwitchingCaption: String { l("settingsplaybackscreen_refresh_rate_switching_caption") }
    static var settingsPlaybackScreenResumeRewind: String { l("settingsplaybackscreen_resume_rewind") }
    static var settingsPlaybackScreenResumeRewindCaption: String { l("settingsplaybackscreen_resume_rewind_caption") }
    static func settingsPlaybackScreenSecondsShort(_ seconds: Int) -> String { l("settingsplaybackscreen_seconds_short", seconds) }
    static var settingsPlaybackScreenShowDescriptionOnPause: String { l("settingsplaybackscreen_show_description_on_pause") }
    static var settingsPlaybackScreenShowDescriptionOnPauseCaption: String { l("settingsplaybackscreen_show_description_on_pause_caption") }
    static var settingsPlaybackScreenSkipBackLength: String { l("settingsplaybackscreen_skip_back_length") }
    static var settingsPlaybackScreenSkipBackLengthCaption: String { l("settingsplaybackscreen_skip_back_length_caption") }
    static var settingsPlaybackScreenSkipForwardLength: String { l("settingsplaybackscreen_skip_forward_length") }
    static var settingsPlaybackScreenSkipForwardLengthCaption: String { l("settingsplaybackscreen_skip_forward_length_caption") }
    static var settingsPlaybackScreenSkipIntrosAndOutros: String { l("settingsplaybackscreen_skip_intros_and_outros") }
    static var settingsPlaybackScreenUnpauseRewind: String { l("settingsplaybackscreen_unpause_rewind") }
    static var settingsPlaybackScreenUnpauseRewindCaption: String { l("settingsplaybackscreen_unpause_rewind_caption") }
    static var settingsPlaybackScreenVideoPlaybackPreferences: String { l("settingsplaybackscreen_video_playback_preferences") }
    static var settingsPlaybackSyncPlayRootScreenAdvancedCaption: String { l("settingsplaybacksyncplayrootscreen_advanced_caption") }
    static var settingsPlaybackSyncPlayRootScreenAdvancedHeading: String { l("settingsplaybacksyncplayrootscreen_advanced_heading") }
    static var settingsPlaybackSyncPlayRootScreenAudioCaption: String { l("settingsplaybacksyncplayrootscreen_audio_caption") }
    static var settingsPlaybackSyncPlayRootScreenAudioHeading: String { l("settingsplaybacksyncplayrootscreen_audio_heading") }
    static var settingsPlaybackSyncPlayRootScreenAutomationCaption: String { l("settingsplaybacksyncplayrootscreen_automation_caption") }
    static var settingsPlaybackSyncPlayRootScreenAutomationHeading: String { l("settingsplaybacksyncplayrootscreen_automation_heading") }
    static var settingsPlaybackSyncPlayRootScreenLiveTvCaption: String { l("settingsplaybacksyncplayrootscreen_live_tv_caption") }
    static var settingsPlaybackSyncPlayRootScreenLiveTvHeading: String { l("settingsplaybacksyncplayrootscreen_live_tv_heading") }
    static var settingsPlaybackSyncPlayRootScreenSubtitlesCaption: String { l("settingsplaybacksyncplayrootscreen_subtitles_caption") }
    static var settingsPlaybackSyncPlayRootScreenSubtitlesHeading: String { l("settingsplaybacksyncplayrootscreen_subtitles_heading") }
    static var settingsPlaybackSyncPlayRootScreenSyncPlayCaption: String { l("settingsplaybacksyncplayrootscreen_syncplay_caption") }
    static var settingsPlaybackSyncPlayRootScreenSyncPlayHeading: String { l("settingsplaybacksyncplayrootscreen_syncplay_heading") }
    static var settingsPlaybackSyncPlayRootScreenTitle: String { l("settingsplaybacksyncplayrootscreen_title") }
    static var settingsPlaybackSyncPlayRootScreenVideoCaption: String { l("settingsplaybacksyncplayrootscreen_video_caption") }
    static var settingsPlaybackSyncPlayRootScreenVideoHeading: String { l("settingsplaybacksyncplayrootscreen_video_heading") }
    static var settingsPluginMediaBarScreenAutoAdvance: String { l("settingspluginmediabarscreen_auto_advance") }
    static var settingsPluginMediaBarScreenAutoAdvanceCaption: String { l("settingspluginmediabarscreen_auto_advance_caption") }
    static var settingsPluginMediaBarScreenAutoAdvanceInterval: String { l("settingspluginmediabarscreen_auto_advance_interval") }
    static var settingsPluginMediaBarScreenAutoAdvanceIntervalCaption: String { l("settingspluginmediabarscreen_auto_advance_interval_caption") }
    static var settingsPluginMediaBarScreenContentType: String { l("settingspluginmediabarscreen_content_type") }
    static var settingsPluginMediaBarScreenContentTypeCaption: String { l("settingspluginmediabarscreen_content_type_caption") }
    static var settingsPluginMediaBarScreenExcludedGenres: String { l("settingspluginmediabarscreen_excluded_genres") }
    static var settingsPluginMediaBarScreenExcludedGenresCaption: String { l("settingspluginmediabarscreen_excluded_genres_caption") }
    static var settingsPluginMediaBarScreenItemCount: String { l("settingspluginmediabarscreen_item_count") }
    static var settingsPluginMediaBarScreenItemCountCaption: String { l("settingspluginmediabarscreen_item_count_caption") }
    static var settingsPluginMediaBarScreenMediaBarColor: String { l("settingspluginmediabarscreen_media_bar_color") }
    static var settingsPluginMediaBarScreenMediaBarOverlay: String { l("settingspluginmediabarscreen_media_bar_overlay") }
    static var settingsPluginMediaBarScreenMediaBarStyle: String { l("settingspluginmediabarscreen_media_bar_style") }
    static var settingsPluginMediaBarScreenMediaBarStyleCaption: String { l("settingspluginmediabarscreen_media_bar_style_caption") }
    static func settingsPluginMediaBarScreenMilliseconds(_ value: Int) -> String { l("settingspluginmediabarscreen_milliseconds", value) }
    static var settingsPluginMediaBarScreenMoviesAndTvShows: String { l("settingspluginmediabarscreen_movies_and_tv_shows") }
    static var settingsPluginMediaBarScreenOverlayColor: String { l("settingspluginmediabarscreen_overlay_color") }
    static var settingsPluginMediaBarScreenOverlayOpacity: String { l("settingspluginmediabarscreen_overlay_opacity") }
    static func settingsPluginMediaBarScreenSelectedCount(_ count: Int) -> String { l("settingspluginmediabarscreen_selected_count", count) }
    static var settingsPluginMediaBarScreenSourceCollections: String { l("settingspluginmediabarscreen_source_collections") }
    static var settingsPluginMediaBarScreenSourceCollectionsCaption: String { l("settingspluginmediabarscreen_source_collections_caption") }
    static var settingsPluginMediaBarScreenSourceLibraries: String { l("settingspluginmediabarscreen_source_libraries") }
    static var settingsPluginMediaBarScreenSourceLibrariesCaption: String { l("settingspluginmediabarscreen_source_libraries_caption") }
    static var settingsPluginMediaBarScreenTrailerAudio: String { l("settingspluginmediabarscreen_trailer_audio") }
    static var settingsPluginMediaBarScreenTrailerAudioCaption: String { l("settingspluginmediabarscreen_trailer_audio_caption") }
    static var settingsScreensaverScreen1Minute: String { l("settingsscreensaverscreen_1_minute") }
    static var settingsScreensaverScreenAllAges: String { l("settingsscreensaverscreen_all_ages") }
    static var settingsScreensaverScreenDimming: String { l("settingsscreensaverscreen_dimming") }
    static var settingsScreensaverScreenDimmingCaption: String { l("settingsscreensaverscreen_dimming_caption") }
    static var settingsScreensaverScreenEnabledCaption: String { l("settingsscreensaverscreen_enabled_caption") }
    static var settingsScreensaverScreenMaxAgeRating: String { l("settingsscreensaverscreen_max_age_rating") }
    static func settingsScreensaverScreenMinShort(_ value: Int) -> String { l("settingsscreensaverscreen_min_short", value) }
    static func settingsScreensaverScreenMinutes(_ value: Int) -> String { l("settingsscreensaverscreen_minutes", value) }
    static var settingsScreensaverScreenMode: String { l("settingsscreensaverscreen_mode") }
    static var settingsScreensaverScreenModeCaption: String { l("settingsscreensaverscreen_mode_caption") }
    static var settingsScreensaverScreenOff: String { l("settingsscreensaverscreen_off") }
    static var settingsScreensaverScreenRequireAgeRating: String { l("settingsscreensaverscreen_require_age_rating") }
    static var settingsScreensaverScreenRequireAgeRatingCaption: String { l("settingsscreensaverscreen_require_age_rating_caption") }
    static var settingsScreensaverScreenScreensaver: String { l("settingsscreensaverscreen_screensaver") }
    static var settingsScreensaverScreenShowClock: String { l("settingsscreensaverscreen_show_clock") }
    static var settingsScreensaverScreenShowClockCaption: String { l("settingsscreensaverscreen_show_clock_caption") }
    static var settingsScreensaverScreenTimeout: String { l("settingsscreensaverscreen_timeout") }
    static var settingsScreensaverScreenTimeoutCaption: String { l("settingsscreensaverscreen_timeout_caption") }
    static func settingsScreensaverScreenUpToAge(_ value: Int) -> String { l("settingsscreensaverscreen_up_to_age", value) }
    static var settingsSeerrRowsScreenDiscoverRows: String { l("settingsseerrrowsscreen_discover_rows") }
    static var settingsSeerrScreenAccountType: String { l("settingsseerrscreen_account_type") }
    static var settingsSeerrScreenAuthenticateWithAccount: String { l("settingsseerrscreen_authenticate_with_account") }
    static var settingsSeerrScreenAuthenticatingWithSeerr: String { l("settingsseerrscreen_authenticating_with_seerr") }
    static var settingsSeerrScreenBlockNsfw: String { l("settingsseerrscreen_block_nsfw") }
    static var settingsSeerrScreenBlockNsfwCaption: String { l("settingsseerrscreen_block_nsfw_caption") }
    static var settingsSeerrScreenChooseAuthMethod: String { l("settingsseerrscreen_choose_auth_method") }
    static var settingsSeerrScreenDiscover: String { l("settingsseerrscreen_discover") }
    static var settingsSeerrScreenDiscoverRows: String { l("settingsseerrscreen_discover_rows") }
    static var settingsSeerrScreenDiscoverRowsCaption: String { l("settingsseerrscreen_discover_rows_caption") }
    static var settingsSeerrScreenEmail: String { l("settingsseerrscreen_email") }
    static var settingsSeerrScreenEnableSeerr: String { l("settingsseerrscreen_enable_seerr") }
    static var settingsSeerrScreenEnableSeerrCaption: String { l("settingsseerrscreen_enable_seerr_caption") }
    static var settingsSeerrScreenFetchLimit: String { l("settingsseerrscreen_fetch_limit") }
    static var settingsSeerrScreenItemsPerPage: String { l("settingsseerrscreen_items_per_page") }
    static var settingsSeerrScreenLocal: String { l("settingsseerrscreen_local") }
    static var settingsSeerrScreenNoActiveSession: String { l("settingsseerrscreen_no_active_session") }
    static var settingsSeerrScreenReturnToIntegrations: String { l("settingsseerrscreen_return_to_integrations") }
    static var settingsSeerrScreenSeerr: String { l("settingsseerrscreen_seerr") }
    static var settingsSeerrScreenSeerrUnavailable: String { l("settingsseerrscreen_seerr_unavailable") }
    static var settingsSeerrScreenShowInNavigation: String { l("settingsseerrscreen_show_in_navigation") }
    static var settingsSeerrScreenShowInNavigationCaption: String { l("settingsseerrscreen_show_in_navigation_caption") }
    static var settingsSeerrScreenShowInToolbar: String { l("settingsseerrscreen_show_in_toolbar") }
    static var settingsSeerrScreenShowInToolbarCaption: String { l("settingsseerrscreen_show_in_toolbar_caption") }
    static var settingsSeerrScreenShowRequestStatus: String { l("settingsseerrscreen_show_request_status") }
    static var settingsSeerrScreenShowRequestStatusCaption: String { l("settingsseerrscreen_show_request_status_caption") }
    static var settingsSeerrScreenSignIn: String { l("settingsseerrscreen_sign_in") }
    static var settingsSeerrScreenSignInFailed: String { l("settingsseerrscreen_sign_in_failed") }
    static var settingsSeerrScreenSignOut: String { l("settingsseerrscreen_sign_out") }
    static var settingsSeerrScreenSignOutCaption: String { l("settingsseerrscreen_sign_out_caption") }
    static var settingsSeerrScreenSignedIn: String { l("settingsseerrscreen_signed_in") }
    static var settingsSeerrScreenSignedInAs: String { l("settingsseerrscreen_signed_in_as") }
    static var settingsSeerrScreenSignedOut: String { l("settingsseerrscreen_signed_out") }
    static var settingsSeerrScreenSigningIn: String { l("settingsseerrscreen_signing_in") }
    static var settingsSubtitleValueScreensDefaultSubtitleLanguage: String { l("settingssubtitlevaluescreens_default_subtitle_language") }
    static var settingsSubtitleValueScreensOffsetPosition: String { l("settingssubtitlevaluescreens_offset_position") }
    static var settingsSubtitleValueScreensTextSize: String { l("settingssubtitlevaluescreens_text_size") }
    static var settingsSubtitlesScreenAppearanceAndPosition: String { l("settingssubtitlesscreen_appearance_and_position") }
    static var settingsSubtitlesScreenAssSsaDirectPlay: String { l("settingssubtitlesscreen_ass_ssa_direct_play") }
    static var settingsSubtitlesScreenBackgroundColor: String { l("settingssubtitlesscreen_background_color") }
    static var settingsSubtitlesScreenDefaultSubtitleLanguage: String { l("settingssubtitlesscreen_default_subtitle_language") }
    static var settingsSubtitlesScreenDefaultToNoSubtitles: String { l("settingssubtitlesscreen_default_to_no_subtitles") }
    static var settingsSubtitlesScreenDistanceFromBottomEdge: String { l("settingssubtitlesscreen_distance_from_bottom_edge") }
    static var settingsSubtitlesScreenEdgeColor: String { l("settingssubtitlesscreen_edge_color") }
    static var settingsSubtitlesScreenEnableDirectPlayForAssSsa: String { l("settingssubtitlesscreen_enable_direct_play_for_ass_ssa") }
    static var settingsSubtitlesScreenEnableDirectPlayForPgs: String { l("settingssubtitlesscreen_enable_direct_play_for_pgs") }
    static var settingsSubtitlesScreenFontSizeForSubtitles: String { l("settingssubtitlesscreen_font_size_for_subtitles") }
    static var settingsSubtitlesScreenOffsetPosition: String { l("settingssubtitlesscreen_offset_position") }
    static var settingsSubtitlesScreenPgsDirectPlay: String { l("settingssubtitlesscreen_pgs_direct_play") }
    static var settingsSubtitlesScreenPreferredSubtitleLanguage: String { l("settingssubtitlesscreen_preferred_subtitle_language") }
    static var settingsSubtitlesScreenSampleSubtitleText: String { l("settingssubtitlesscreen_sample_subtitle_text") }
    static var settingsSubtitlesScreenStartPlaybackWithSubtitlesOff: String { l("settingssubtitlesscreen_start_playback_with_subtitles_off") }
    static var settingsSubtitlesScreenSubtitleCustomization: String { l("settingssubtitlesscreen_subtitle_customization") }
    static var settingsSubtitlesScreenTextColor: String { l("settingssubtitlesscreen_text_color") }
    static var settingsSubtitlesScreenTextSize: String { l("settingssubtitlesscreen_text_size") }
    static var settingsSyncPlayScreenAdvancedCorrection: String { l("settingssyncplayscreen_advanced_correction") }
    static var settingsSyncPlayScreenAdvancedCorrectionCaption: String { l("settingssyncplayscreen_advanced_correction_caption") }
    static var settingsSyncPlayScreenButton: String { l("settingssyncplayscreen_button") }
    static var settingsSyncPlayScreenButtonCaption: String { l("settingssyncplayscreen_button_caption") }
    static var settingsSyncPlayScreenEnabledCaption: String { l("settingssyncplayscreen_enabled_caption") }
    static var settingsSyncPlayScreenExtraOffsetCaption: String { l("settingssyncplayscreen_extra_offset_caption") }
    static var settingsSyncPlayScreenIgnoreWaitCaption: String { l("settingssyncplayscreen_ignore_wait_caption") }
    static var settingsSyncPlayScreenIgnoreWaitCurrentGroup: String { l("settingssyncplayscreen_ignore_wait_current_group") }
    static var settingsSyncPlayScreenMaxDelaySpeedCaption: String { l("settingssyncplayscreen_max_delay_speed_caption") }
    static var settingsSyncPlayScreenMinDelaySkipCaption: String { l("settingssyncplayscreen_min_delay_skip_caption") }
    static var settingsSyncPlayScreenMinDelaySpeedCaption: String { l("settingssyncplayscreen_min_delay_speed_caption") }
    static var settingsSyncPlayScreenOpenGroups: String { l("settingssyncplayscreen_open_groups") }
    static var settingsSyncPlayScreenOpenGroupsCaption: String { l("settingssyncplayscreen_open_groups_caption") }
    static var settingsSyncPlayScreenSkipToSync: String { l("settingssyncplayscreen_skip_to_sync") }
    static var settingsSyncPlayScreenSkipToSyncCaption: String { l("settingssyncplayscreen_skip_to_sync_caption") }
    static var settingsSyncPlayScreenSpeedDurationCaption: String { l("settingssyncplayscreen_speed_duration_caption") }
    static var settingsSyncPlayScreenSpeedToSync: String { l("settingssyncplayscreen_speed_to_sync") }
    static var settingsSyncPlayScreenSpeedToSyncCaption: String { l("settingssyncplayscreen_speed_to_sync_caption") }
    static var settingsSyncPlayScreenSyncCorrection: String { l("settingssyncplayscreen_sync_correction") }
    static var settingsSyncPlayScreenSyncCorrectionCaption: String { l("settingssyncplayscreen_sync_correction_caption") }
    static var settingsTelemetryScreenIncludeLogs: String { l("settingstelemetryscreen_include_logs") }
    static var settingsTelemetryScreenIncludeLogsCaption: String { l("settingstelemetryscreen_include_logs_caption") }
    static var settingsTelemetryScreenSendCrashReports: String { l("settingstelemetryscreen_send_crash_reports") }
    static var settingsTelemetryScreenSendCrashReportsCaption: String { l("settingstelemetryscreen_send_crash_reports_caption") }
    static var settingsTelemetryScreenTitle: String { l("settingstelemetryscreen_title") }
    static func simpleInfoRowTrackCountPlural(_ count: Int) -> String { l("simpleinforow_track_count_plural", count) }
    static func simpleInfoRowTrackCountSingular(_ count: Int) -> String { l("simpleinforow_track_count_singular", count) }
    static func stillWatchingSettingsScreenEveryXEpisodes(_ count: Int) -> String { l("stillwatchingsettingsscreen_every_x_episodes", count) }
    static var stillWatchingSettingsScreenTitle: String { l("stillwatchingsettingsscreen_title") }
    static var syncPlayRuntimeCoordinatorServerRestarting: String { l("syncplayruntimecoordinator_server_restarting") }
    static var syncPlayRuntimeCoordinatorServerShuttingDown: String { l("syncplayruntimecoordinator_server_shutting_down") }
    static var syncPlayRuntimeCoordinatorSessionEnded: String { l("syncplayruntimecoordinator_session_ended") }


    // MARK: - Localized (enum/display sweep)

    static var mediaSegmentModelsActionAskToSkip: String { l("mediasegmentmodels_action_ask_to_skip") }
    static var mediaSegmentModelsActionNothing: String { l("mediasegmentmodels_action_nothing") }
    static var mediaSegmentModelsSkip: String { l("mediasegmentmodels_skip") }
    static var mediaSegmentModelsTypeCommercial: String { l("mediasegmentmodels_type_commercial") }
    static var mediaSegmentModelsTypeIntro: String { l("mediasegmentmodels_type_intro") }
    static var mediaSegmentModelsTypeOutro: String { l("mediasegmentmodels_type_outro") }
    static var mediaSegmentModelsTypePreview: String { l("mediasegmentmodels_type_preview") }
    static var mediaSegmentModelsTypeRecap: String { l("mediasegmentmodels_type_recap") }
    static var mediaSegmentModelsTypeUnknown: String { l("mediasegmentmodels_type_unknown") }
    static var userViewsServiceCustomSection: String { l("userviewsservice_custom_section") }
    static var userViewsServiceRecentlyReleasedEpisodes: String { l("userviewsservice_recently_released_episodes") }
    static var userViewsServiceRecentlyReleasedMovies: String { l("userviewsservice_recently_released_movies") }
    static var userViewsServiceWatchAgain: String { l("userviewsservice_watch_again") }
    static var videoPlayerViewModelForced: String { l("videoplayerviewmodel_forced") }
}
