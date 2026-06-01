import SwiftUI

struct SettingsAutomationQueueScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsAutomationQueueScreenTitle) {
            SettingsToggleButton(
                icon: "film.stack",
                heading: Strings.settingsAutomationQueueScreenCinemaMode,
                caption: Strings.settingsAutomationQueueScreenCinemaModeCaption,
                isOn: prefs.binding(for: UserPreferences.cinemaModeEnabled)
            )

            SettingsToggleButton(
                icon: "list.bullet.rectangle",
                heading: Strings.settingsAutomationQueueScreenMediaQueuing,
                caption: Strings.settingsAutomationQueueScreenMediaQueuingCaption,
                isOn: prefs.binding(for: UserPreferences.mediaQueuingEnabled)
            )

            SettingsListButton(
                icon: "forward.end",
                heading: Strings.settingsAutomationQueueScreenNextUpDisplay,
                caption: Strings.settingsAutomationQueueScreenNextUpDisplayCaption,
                trailingText: prefs[UserPreferences.nextUpBehavior].displayName,
                action: { settingsRouter.navigate(to: .playbackNextUpBehavior) }
            )
            .focused($focusedRoute, equals: .playbackNextUpBehavior)

            SettingsListButton(
                icon: "timer",
                heading: Strings.settingsAutomationQueueScreenNextUpTimeout,
                caption: Strings.settingsAutomationQueueScreenNextUpTimeoutCaption,
                trailingText: "\(prefs[UserPreferences.nextUpTimeout])s",
                action: { settingsRouter.navigate(to: .playbackNextUpTimeout) }
            )
            .focused($focusedRoute, equals: .playbackNextUpTimeout)

            SettingsListButton(
                icon: "pause.circle",
                heading: Strings.settingsAutomationQueueScreenStillWatchingPrompt,
                caption: Strings.settingsAutomationQueueScreenStillWatchingPromptCaption,
                action: { settingsRouter.navigate(to: .playbackInactivityPrompt) }
            )
            .focused($focusedRoute, equals: .playbackInactivityPrompt)
        }
        .restoresFocus($focusedRoute)
    }
}
