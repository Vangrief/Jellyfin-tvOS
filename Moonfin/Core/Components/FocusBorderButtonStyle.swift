import SwiftUI

struct CleanButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct FocusableDialogButton: View {
    let title: String
    let action: () -> Void

    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var container: AppContainer
    @FocusState private var isFocused: Bool

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.bodyMd)
                .fontWeight(.medium)
                .foregroundColor(isFocused ? theme.colorScheme.onButtonFocused : theme.colorScheme.onBackground)
                .padding(.horizontal, SpaceTokens.spaceLg)
                .padding(.vertical, SpaceTokens.spaceSm)
                .background(
                    RoundedRectangle(cornerRadius: RadiusTokens.small)
                        .fill(isFocused ? theme.colorScheme.buttonFocused : theme.colorScheme.button.opacity(0.1))
                )
        }
        .buttonStyle(CleanButtonStyle())
        .focused($isFocused)
        .onChange(of: isFocused) { focused in
            if focused {
                container.inactivityTracker.notifyInteraction()
            }
        }
    }
}
