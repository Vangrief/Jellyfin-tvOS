import SwiftUI

struct SettingsDefaultSubtitleLanguageScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: DefaultSubtitleLanguage {
        container.userPreferences[UserPreferences.defaultSubtitleLanguage]
    }

    private let options = DefaultSubtitleLanguage.allCases

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsSubtitleValueScreensDefaultSubtitleLanguage) {
            ForEach(options, id: \.self) { value in
                Button {
                    container.userPreferences[UserPreferences.defaultSubtitleLanguage] = value
                } label: {
                    RadioOptionContent(label: value.displayName, isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}

struct SettingsSubtitleTextSizeScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.subtitlesTextSize] }
    private let options: [Int] = [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsSubtitleValueScreensTextSize) {
            ForEach(options, id: \.self) { value in
                Button {
                    container.userPreferences[UserPreferences.subtitlesTextSize] = value
                } label: {
                    RadioOptionContent(label: "\(value)pt", isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}

struct SettingsSubtitleOffsetScreen: View {
    @EnvironmentObject var container: AppContainer

    private var current: Int { container.userPreferences[UserPreferences.subtitlesOffsetPosition] }
    private let options: [Int] = [0, 2, 4, 6, 8, 10, 15, 20, 25, 30]

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsSubtitleValueScreensOffsetPosition) {
            ForEach(options, id: \.self) { value in
                Button {
                    container.userPreferences[UserPreferences.subtitlesOffsetPosition] = value
                } label: {
                    RadioOptionContent(label: "\(value)%", isSelected: current == value)
                }
                .buttonStyle(CleanButtonStyle())
            }
        }
    }
}
