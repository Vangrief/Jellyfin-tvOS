import SwiftUI

struct SettingsTelemetryScreen: View {
    @EnvironmentObject var container: AppContainer

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsTelemetryScreenTitle) {
            SettingsToggleButton(
                icon: "ladybug",
                heading: Strings.settingsTelemetryScreenSendCrashReports,
                caption: Strings.settingsTelemetryScreenSendCrashReportsCaption,
                isOn: container.telemetryPreferences.binding(for: TelemetryPreferences.crashReportEnabled)
            )

            SettingsToggleButton(
                icon: "doc.text",
                heading: Strings.settingsTelemetryScreenIncludeLogs,
                caption: Strings.settingsTelemetryScreenIncludeLogsCaption,
                isOn: container.telemetryPreferences.binding(for: TelemetryPreferences.crashReportIncludeLogs)
            )
        }
    }
}
