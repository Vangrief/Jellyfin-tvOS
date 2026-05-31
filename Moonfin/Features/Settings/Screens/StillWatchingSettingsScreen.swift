import SwiftUI

struct StillWatchingSettingsScreen: View {
    @EnvironmentObject var container: AppContainer

    private var currentValue: Int {
        container.userPreferences[UserPreferences.stillWatchingThreshold]
    }

    private let options = [0, 2, 3, 5, 7, 10]

    var body: some View {
        SettingsScreenLayout(title: Strings.stillWatchingSettingsScreenTitle) {
            ForEach(options, id: \.self) { count in
                StillWatchingOptionRow(
                    label: count > 0 ? Strings.stillWatchingSettingsScreenEveryXEpisodes(count) : Strings.disabled,
                    isSelected: currentValue == count
                ) {
                    container.userPreferences[UserPreferences.stillWatchingThreshold] = count
                }
            }
        }
    }
}

private struct StillWatchingOptionRow: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            StillWatchingOptionContent(label: label, isSelected: isSelected)
        }
        .buttonStyle(CleanButtonStyle())
    }
}

private struct StillWatchingOptionContent: View {
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
