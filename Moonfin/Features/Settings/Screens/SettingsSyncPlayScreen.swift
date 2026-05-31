import SwiftUI

struct SettingsSyncPlayScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }
    private var syncPlayManager: SyncPlayManager { container.syncPlayManager }

    var body: some View {
        SettingsScreenLayout(title: Strings.syncPlay) {
            SettingsListButton(
                icon: "person.3.sequence",
                heading: Strings.settingsSyncPlayScreenOpenGroups,
                caption: Strings.settingsSyncPlayScreenOpenGroupsCaption,
                action: { settingsRouter.navigate(to: .syncPlay) }
            )
            .focused($focusedRoute, equals: .syncPlay)

            SettingsToggleButton(
                icon: "person.3.fill",
                heading: Strings.enabled,
                caption: Strings.settingsSyncPlayScreenEnabledCaption,
                isOn: prefs.binding(for: UserPreferences.syncPlayEnabled)
            )

            SettingsToggleButton(
                icon: "button.programmable",
                heading: Strings.settingsSyncPlayScreenButton,
                caption: Strings.settingsSyncPlayScreenButtonCaption,
                isOn: prefs.binding(for: UserPreferences.showSyncPlayButton)
            )

            SettingsToggleButton(
                icon: "exclamationmark.shield",
                heading: Strings.settingsSyncPlayScreenAdvancedCorrection,
                caption: Strings.settingsSyncPlayScreenAdvancedCorrectionCaption,
                isOn: prefs.binding(for: UserPreferences.syncPlayAdvancedCorrectionEnabled)
            )

            SettingsToggleButton(
                icon: "arrow.trianglehead.2.clockwise",
                heading: Strings.settingsSyncPlayScreenSyncCorrection,
                caption: Strings.settingsSyncPlayScreenSyncCorrectionCaption,
                isOn: prefs.binding(for: UserPreferences.syncPlayEnableSyncCorrection)
            )

            SettingsToggleButton(
                icon: "speedometer",
                heading: Strings.settingsSyncPlayScreenSpeedToSync,
                caption: Strings.settingsSyncPlayScreenSpeedToSyncCaption,
                isOn: prefs.binding(for: UserPreferences.syncPlayUseSpeedToSync)
            )

            SettingsToggleButton(
                icon: "forward.fill",
                heading: Strings.settingsSyncPlayScreenSkipToSync,
                caption: Strings.settingsSyncPlayScreenSkipToSyncCaption,
                isOn: prefs.binding(for: UserPreferences.syncPlayUseSkipToSync)
            )

            SettingsListButton(
                icon: "timer",
                heading: Strings.syncPlayMinDelaySpeed,
                caption: Strings.settingsSyncPlayScreenMinDelaySpeedCaption,
                trailingText: "\(prefs[UserPreferences.syncPlayMinDelaySpeedToSync])",
                action: { settingsRouter.navigate(to: .moonfinSyncPlayMinDelay) }
            )
            .focused($focusedRoute, equals: .moonfinSyncPlayMinDelay)

            SettingsListButton(
                icon: "timer",
                heading: Strings.syncPlayMaxDelaySpeed,
                caption: Strings.settingsSyncPlayScreenMaxDelaySpeedCaption,
                trailingText: "\(prefs[UserPreferences.syncPlayMaxDelaySpeedToSync])",
                action: { settingsRouter.navigate(to: .moonfinSyncPlayMaxDelay) }
            )
            .focused($focusedRoute, equals: .moonfinSyncPlayMaxDelay)

            SettingsListButton(
                icon: "clock.arrow.circlepath",
                heading: Strings.syncPlaySpeedDuration,
                caption: Strings.settingsSyncPlayScreenSpeedDurationCaption,
                trailingText: "\(prefs[UserPreferences.syncPlaySpeedToSyncDuration])",
                action: { settingsRouter.navigate(to: .moonfinSyncPlayDuration) }
            )
            .focused($focusedRoute, equals: .moonfinSyncPlayDuration)

            SettingsListButton(
                icon: "forward.end.fill",
                heading: Strings.syncPlayMinDelaySkip,
                caption: Strings.settingsSyncPlayScreenMinDelaySkipCaption,
                trailingText: "\(prefs[UserPreferences.syncPlayMinDelaySkipToSync])",
                action: { settingsRouter.navigate(to: .moonfinSyncPlayMinDelaySkip) }
            )
            .focused($focusedRoute, equals: .moonfinSyncPlayMinDelaySkip)

            SettingsListButton(
                icon: "clock.badge.questionmark",
                heading: Strings.syncPlayExtraOffset,
                caption: Strings.settingsSyncPlayScreenExtraOffsetCaption,
                trailingText: "\(prefs[UserPreferences.syncPlayExtraTimeOffset])",
                action: { settingsRouter.navigate(to: .moonfinSyncPlayExtraOffset) }
            )
            .focused($focusedRoute, equals: .moonfinSyncPlayExtraOffset)

            if syncPlayManager.state.enabled {
                SettingsToggleButton(
                    icon: "hourglass",
                    heading: Strings.settingsSyncPlayScreenIgnoreWaitCurrentGroup,
                    caption: Strings.settingsSyncPlayScreenIgnoreWaitCaption,
                    isOn: Binding(
                        get: { syncPlayManager.ignoreWaitEnabled },
                        set: { syncPlayManager.requestSetIgnoreWait($0) }
                    )
                )
            }
        }
        .restoresFocus($focusedRoute)
    }
}
