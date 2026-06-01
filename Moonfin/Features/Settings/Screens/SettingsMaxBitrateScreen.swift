import SwiftUI

struct SettingsMaxBitrateScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.maxBitrate] }

    private let options: [(Int, String)] = [
        (0, Strings.optionAuto),
        (120_000_000, Strings.settingsMaxBitrateScreen120Mbps4kHigh),
        (80_000_000, Strings.settingsMaxBitrateScreen80Mbps4k),
        (60_000_000, Strings.settingsMaxBitrateScreen60Mbps4k),
        (40_000_000, Strings.settingsMaxBitrateScreen40Mbps1080pHigh),
        (20_000_000, Strings.settingsMaxBitrateScreen20Mbps1080p),
        (15_000_000, Strings.settingsMaxBitrateScreen15Mbps1080p),
        (10_000_000, Strings.settingsMaxBitrateScreen10Mbps720p),
        (8_000_000, Strings.settingsMaxBitrateScreen8Mbps720p),
        (6_000_000, Strings.settingsMaxBitrateScreen6Mbps),
        (4_000_000, Strings.settingsMaxBitrateScreen4Mbps),
        (3_000_000, Strings.settingsMaxBitrateScreen3Mbps),
        (2_000_000, Strings.settingsMaxBitrateScreen2Mbps480p),
        (1_500_000, Strings.settingsMaxBitrateScreen15Mbps),
        (1_000_000, Strings.settingsMaxBitrateScreen1Mbps),
        (700_000, Strings.settingsMaxBitrateScreen07Mbps360p),
        (420_000, Strings.settingsMaxBitrateScreen042Mbps),
    ]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsMaxBitrateScreenMaxBitrate) {
            ForEach(options, id: \.0) { value, label in
                Button {
                    container.userPreferences[UserPreferences.maxBitrate] = value
                } label: {
                    RadioOptionContent(label: label, isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}
