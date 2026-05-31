import SwiftUI

struct PlayerLoadingOverlay: View {
    var label: String?
    var logoSize: CGFloat = 200
    var labelSpacing: CGFloat = 48

    private static let labelGradient = LinearGradient(
        colors: [Color(hex: 0xAA5CC3), Color(hex: 0x00A4DC)],
        startPoint: .leading,
        endPoint: .trailing
    )

    @State private var logoAngle: Double = 0
    @State private var labelPulse: CGFloat = 0

    private var trimmedLabel: String? {
        guard let label = label?.trimmingCharacters(in: .whitespacesAndNewlines),
              !label.isEmpty else { return nil }
        return label
    }

    var body: some View {
        VStack(spacing: trimmedLabel == nil ? 0 : labelSpacing) {
            MoonfinLogo(size: logoSize)
                .rotation3DEffect(
                    .degrees(logoAngle),
                    axis: (x: 0, y: 1, z: 0),
                    perspective: 0.5
                )

            if let label = trimmedLabel {
                gradientLabel(label.uppercased())
                    .opacity(0.4 + 0.6 * Double(labelPulse))
                    .scaleEffect(0.98 + 0.02 * labelPulse)
            }
        }
        .allowsHitTesting(false)
        .onAppear {
            withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                logoAngle = 360
            }
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                labelPulse = 1
            }
        }
    }

    private func gradientLabel(_ text: String) -> some View {
        Text(text)
            .font(.token(TypographyTokens.fontSizeSm, weight: .bold))
            .tracking(8)
            .multilineTextAlignment(.center)
            .foregroundStyle(Self.labelGradient)
    }
}
