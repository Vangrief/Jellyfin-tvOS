import SwiftUI

struct SettingsScreensaverScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsScreensaverScreenScreensaver) {
            SettingsToggleButton(
                icon: "moon.fill",
                heading: Strings.enabled,
                caption: Strings.settingsScreensaverScreenEnabledCaption,
                isOn: Binding(
                    get: { prefs[UserPreferences.screensaverEnabled] },
                    set: { prefs[UserPreferences.screensaverEnabled] = $0 }
                )
            )

            SettingsListButton(
                icon: "wand.and.stars",
                heading: Strings.settingsScreensaverScreenMode,
                caption: Strings.settingsScreensaverScreenModeCaption,
                trailingText: prefs[UserPreferences.screensaverMode].displayName,
                action: { settingsRouter.navigate(to: .customizationScreensaverMode) }
            )
            .focused($focusedRoute, equals: .customizationScreensaverMode)

            SettingsListButton(
                icon: "timer",
                heading: Strings.settingsScreensaverScreenTimeout,
                caption: Strings.settingsScreensaverScreenTimeoutCaption,
                trailingText: Strings.settingsScreensaverScreenMinShort(prefs[UserPreferences.screensaverTimeout]),
                action: { settingsRouter.navigate(to: .customizationScreensaverTimeout) }
            )
            .focused($focusedRoute, equals: .customizationScreensaverTimeout)

            SettingsListButton(
                icon: "circle.lefthalf.filled",
                heading: Strings.settingsScreensaverScreenDimming,
                caption: Strings.settingsScreensaverScreenDimmingCaption,
                trailingText: dimmingCaption,
                action: { settingsRouter.navigate(to: .customizationScreensaverDimming) }
            )
            .focused($focusedRoute, equals: .customizationScreensaverDimming)

            SettingsToggleButton(
                icon: "clock",
                heading: Strings.settingsScreensaverScreenShowClock,
                caption: Strings.settingsScreensaverScreenShowClockCaption,
                isOn: Binding(
                    get: { prefs[UserPreferences.screensaverShowClock] },
                    set: { prefs[UserPreferences.screensaverShowClock] = $0 }
                )
            )

            SettingsToggleButton(
                icon: "person.badge.shield.checkmark",
                heading: Strings.settingsScreensaverScreenRequireAgeRating,
                caption: Strings.settingsScreensaverScreenRequireAgeRatingCaption,
                isOn: prefs.binding(for: UserPreferences.screensaverAgeRatingRequired)
            )

            SettingsListButton(
                icon: "exclamationmark.triangle",
                heading: Strings.settingsScreensaverScreenMaxAgeRating,
                caption: ageRatingCaption,
                action: { settingsRouter.navigate(to: .customizationScreensaverAgeRating) }
            )
            .focused($focusedRoute, equals: .customizationScreensaverAgeRating)
        }
        .restoresFocus($focusedRoute)
    }

    private var dimmingCaption: String {
        let level = prefs[UserPreferences.screensaverDimmingLevel]
        return level == 0 ? Strings.settingsScreensaverScreenOff : "\(level)%"
    }

    private var ageRatingCaption: String {
        let value = prefs[UserPreferences.screensaverAgeRatingMax]
        if value < 0 { return Strings.disabled }
        if value == 0 { return Strings.settingsScreensaverScreenAllAges }
        return Strings.settingsScreensaverScreenUpToAge(value)
    }
}

struct SettingsScreensaverTimeoutScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.screensaverTimeout] }
    private let options: [(Int, String)] = [
        (1, Strings.settingsScreensaverScreen1Minute), (2, Strings.settingsScreensaverScreenMinutes(2)),
        (3, Strings.settingsScreensaverScreenMinutes(3)), (5, Strings.settingsScreensaverScreenMinutes(5)),
        (10, Strings.settingsScreensaverScreenMinutes(10)), (15, Strings.settingsScreensaverScreenMinutes(15)),
        (30, Strings.settingsScreensaverScreenMinutes(30)),
    ]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsScreensaverScreenTimeout) {
            ForEach(options, id: \.0) { value, label in
                Button {
                    container.userPreferences[UserPreferences.screensaverTimeout] = value
                } label: {
                    ScreensaverOptionContent(label: label, isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}

struct SettingsScreensaverDimmingScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.screensaverDimmingLevel] }
    private let options: [Int] = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsScreensaverScreenDimming) {
            ForEach(options, id: \.self) { value in
                Button {
                    container.userPreferences[UserPreferences.screensaverDimmingLevel] = value
                } label: {
                    ScreensaverOptionContent(
                        label: value == 0 ? Strings.settingsScreensaverScreenOff : "\(value)%",
                        isSelected: current == value
                    )
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}

struct SettingsScreensaverAgeRatingScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.screensaverAgeRatingMax] }
    private let options: [(Int, String)] = [
        (0, Strings.settingsScreensaverScreenAllAges), (5, Strings.settingsScreensaverScreenUpToAge(5)),
        (10, Strings.settingsScreensaverScreenUpToAge(10)), (13, Strings.settingsScreensaverScreenUpToAge(13)),
        (14, Strings.settingsScreensaverScreenUpToAge(14)), (16, Strings.settingsScreensaverScreenUpToAge(16)),
        (18, Strings.settingsScreensaverScreenUpToAge(18)), (21, Strings.settingsScreensaverScreenUpToAge(21)),
        (-1, Strings.disabled),
    ]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsScreensaverScreenMaxAgeRating) {
            ForEach(options, id: \.0) { value, label in
                Button {
                    container.userPreferences[UserPreferences.screensaverAgeRatingMax] = value
                } label: {
                    ScreensaverOptionContent(label: label, isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}

private struct ScreensaverOptionContent: View {
    let label: String
    let isSelected: Bool

    @EnvironmentObject var theme: MoonfinTheme
    @Environment(\.isFocused) private var isFocused

    var body: some View {
        HStack(spacing: SpaceTokens.spaceMd) {
            Text(label)
                .font(.bodyMd)
                .foregroundColor(isFocused ? theme.colorScheme.listHeadlineFocused : theme.colorScheme.listHeadline)

            Spacer()

            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .font(.bodyMd)
                .foregroundColor(isSelected
                    ? (isFocused ? theme.colorScheme.listHeadlineFocused : theme.accent)
                    : (isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption))
        }
        .padding(.horizontal, SpaceTokens.spaceMd)
        .padding(.vertical, SpaceTokens.spaceSm)
        .background(
            RoundedRectangle(cornerRadius: RadiusTokens.small, style: .continuous)
                .fill(isFocused ? theme.colorScheme.listButtonFocused : theme.colorScheme.listButton)
        )
        .animation(.easeInOut(duration: 0.15), value: isFocused)
    }
}
