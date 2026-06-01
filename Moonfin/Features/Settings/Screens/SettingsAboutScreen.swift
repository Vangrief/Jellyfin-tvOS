import SwiftUI
import CoreImage.CIFilterBuiltins

struct SettingsAboutScreen: View {
    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?
    @State private var qrItem: AboutLink?

    private let updatesSupported = false

    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? Strings.unknown
    }

    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? Strings.unknown
    }

    var body: some View {
        SettingsScreenLayout(title: Strings.about) {
            aboutItem(label: Strings.aboutVersion, value: appVersion)
            aboutItem(label: Strings.aboutBuild, value: buildNumber)

            if updatesSupported {
                SettingsListButton(
                    icon: "arrow.down.circle",
                    heading: Strings.settingsAboutScreenCheckForUpdates,
                    caption: Strings.settingsAboutScreenCheckForUpdatesCaption,
                    action: { }
                )
            }

            SettingsListButton(
                icon: "chevron.left.forwardslash.chevron.right",
                heading: Strings.settingsAboutScreenSourceCode,
                caption: Strings.settingsAboutScreenSourceCodeCaption,
                action: { qrItem = AboutLink(title: Strings.settingsAboutScreenSourceCode, url: "https://github.com/Moonfin-Client/tvOS") }
            )

            SettingsListButton(
                icon: "ladybug",
                heading: Strings.settingsAboutScreenReportAnIssue,
                caption: Strings.settingsAboutScreenReportAnIssueCaption,
                action: { qrItem = AboutLink(title: Strings.settingsAboutScreenReportAnIssue, url: "https://github.com/Moonfin-Client/tvOS/issues") }
            )

            SettingsListButton(
                icon: "message",
                heading: Strings.settingsAboutScreenJoinDiscord,
                caption: Strings.settingsAboutScreenJoinDiscordCaption,
                action: { qrItem = AboutLink(title: Strings.settingsAboutScreenJoinDiscord, url: "https://discord.gg/moonfin") }
            )

            SettingsListButton(
                icon: "heart",
                heading: Strings.settingsAboutScreenSupportMoonfin,
                caption: Strings.settingsAboutScreenSupportMoonfinCaption,
                action: { qrItem = AboutLink(title: Strings.settingsAboutScreenSupportMoonfin, url: "https://buymeacoffee.com/moonfin") }
            )

            SettingsListButton(
                icon: "hand.raised",
                heading: Strings.settingsAboutScreenPrivacyPolicy,
                caption: Strings.settingsAboutScreenPrivacyPolicyCaption,
                action: { qrItem = AboutLink(title: Strings.settingsAboutScreenPrivacyPolicy, url: "https://github.com/Moonfin-Client/tvOS/PRIVACY") }
            )

            SettingsListButton(
                icon: "chart.bar",
                heading: Strings.playerTelemetry,
                caption: Strings.settingsAboutScreenTelemetryCaption,
                action: { settingsRouter.navigate(to: .telemetry) }
            )
            .focused($focusedRoute, equals: .telemetry)

            SettingsListButton(
                icon: "doc.text",
                heading: Strings.licenses,
                caption: Strings.licensesDescription,
                action: { settingsRouter.navigate(to: .licenses) }
            )
            .focused($focusedRoute, equals: .licenses)
        }
        .sheet(item: $qrItem) { item in
            SettingsQRCodeSheet(title: item.title, url: item.url)
        }
        .restoresFocus($focusedRoute)
    }

    private func aboutItem(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.bodyMd)
                .foregroundColor(theme.colorScheme.listHeadline)
            Spacer()
            Text(value)
                .font(.bodySm)
                .foregroundColor(theme.colorScheme.listCaption)
        }
        .padding(.horizontal, SpaceTokens.spaceMd)
        .padding(.vertical, SpaceTokens.spaceSm)
    }
}

private struct AboutLink: Identifiable {
    let id = UUID()
    let title: String
    let url: String
}

private struct SettingsQRCodeSheet: View {
    let title: String
    let url: String

    @EnvironmentObject private var theme: MoonfinTheme
    @Environment(\.dismiss) private var dismiss

    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        VStack(spacing: SpaceTokens.spaceMd) {
            Text(title)
                .font(.title3)
                .foregroundColor(theme.colorScheme.onBackground)

            if let image = generateQRCode(from: url) {
                Image(uiImage: image)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260, height: 260)
                    .background(Color.white)
                    .cornerRadius(RadiusTokens.small)
            }

            Text(url)
                .font(.caption)
                .foregroundColor(theme.colorScheme.listCaption)
                .multilineTextAlignment(.center)
                .padding(.horizontal, SpaceTokens.spaceMd)

            Button(Strings.settingsAboutScreenDone) {
                dismiss()
            }
            .buttonStyle(CleanButtonStyle())
            .padding(.top, SpaceTokens.spaceSm)
        }
        .padding(SpaceTokens.spaceLg)
    }

    private func generateQRCode(from string: String) -> UIImage? {
        filter.message = Data(string.utf8)

        guard let outputImage = filter.outputImage else { return nil }
        let scaled = outputImage.transformed(by: CGAffineTransform(scaleX: 12, y: 12))

        guard let cgImage = context.createCGImage(scaled, from: scaled.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
