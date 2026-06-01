import SwiftUI

struct SettingsAccountSecurityScreen: View {
    @EnvironmentObject var settingsRouter: SettingsRouter
    @EnvironmentObject var container: AppContainer
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsAccountSecurityScreenTitle) {
            SettingsListButton(
                icon: "arrow.left.arrow.right",
                heading: Strings.settingsAccountSecurityScreenSortServersBy,
                caption: Strings.settingsAccountSecurityScreenSortServersByCaption,
                trailingText: container.authPreferences.sortBy.displayName,
                action: { settingsRouter.navigate(to: .authenticationSortBy) }
            )
            .focused($focusedRoute, equals: .authenticationSortBy)

            SettingsListButton(
                icon: "person.crop.circle.badge.checkmark",
                heading: Strings.settingsAccountSecurityScreenAutoLogin,
                caption: Strings.settingsAccountSecurityScreenAutoLoginCaption,
                trailingText: container.authPreferences.autoLoginBehavior.displayName,
                action: { settingsRouter.navigate(to: .authenticationAutoSignIn) }
            )
            .focused($focusedRoute, equals: .authenticationAutoSignIn)

            SettingsToggleButton(
                icon: "lock",
                heading: Strings.settingsAccountSecurityScreenAlwaysAuthenticate,
                caption: Strings.settingsAccountSecurityScreenAlwaysAuthenticateCaption,
                isOn: Binding(
                    get: { container.authPreferences.alwaysAuthenticate },
                    set: { container.authPreferences.alwaysAuthenticate = $0 }
                )
            )

            SettingsListButton(
                icon: "person.crop.circle.badge.checkmark",
                heading: Strings.authentication,
                caption: Strings.settingsAccountSecurityScreenAuthenticationCaption,
                action: { settingsRouter.navigate(to: .authentication) }
            )
            .focused($focusedRoute, equals: .authentication)

            SettingsListButton(
                icon: "lock",
                heading: Strings.settingsAccountSecurityScreenPinCode,
                caption: Strings.settingsAccountSecurityScreenPinCodeCaption,
                action: { settingsRouter.navigate(to: .authenticationPinCode) }
            )
            .focused($focusedRoute, equals: .authenticationPinCode)

            SettingsListButton(
                icon: "lock.shield",
                heading: Strings.settingsAccountSecurityScreenBlockedRatings,
                caption: Strings.settingsAccountSecurityScreenBlockedRatingsCaption,
                trailingText: container.parentalControlsRepository.isEnabled ? Strings.enabled : Strings.disabled,
                action: { settingsRouter.navigate(to: .moonfinParentalControls) }
            )
            .focused($focusedRoute, equals: .moonfinParentalControls)

            SettingsToggleButton(
                icon: "rectangle.portrait.and.arrow.right",
                heading: Strings.settingsAccountSecurityScreenConfirmExit,
                caption: Strings.settingsAccountSecurityScreenConfirmExitCaption,
                isOn: prefs.binding(for: UserPreferences.confirmExit)
            )
        }
        .restoresFocus($focusedRoute)
    }
}
