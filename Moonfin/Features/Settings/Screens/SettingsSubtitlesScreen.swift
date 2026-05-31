import SwiftUI

struct SettingsSubtitlesScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.subtitlesSettings) {
            SettingsListButton(
                icon: "globe",
                heading: Strings.settingsSubtitlesScreenDefaultSubtitleLanguage,
                caption: Strings.settingsSubtitlesScreenPreferredSubtitleLanguage,
                trailingText: prefs[UserPreferences.defaultSubtitleLanguage].displayName,
                action: { settingsRouter.navigate(to: .customizationDefaultSubtitleLanguage) }
            )
            SettingsToggleButton(
                icon: "captions.bubble",
                heading: Strings.settingsSubtitlesScreenDefaultToNoSubtitles,
                caption: Strings.settingsSubtitlesScreenStartPlaybackWithSubtitlesOff,
                isOn: prefs.binding(for: UserPreferences.subtitlesDefaultToNone)
            )
            SettingsListButton(
                icon: "paintbrush",
                heading: Strings.settingsSubtitlesScreenSubtitleCustomization,
                caption: Strings.settingsSubtitlesScreenAppearanceAndPosition,
                action: { settingsRouter.navigate(to: .customizationSubtitles) }
            )
            SettingsToggleButton(
                icon: "photo",
                heading: Strings.settingsSubtitlesScreenPgsDirectPlay,
                caption: Strings.settingsSubtitlesScreenEnableDirectPlayForPgs,
                isOn: prefs.binding(for: UserPreferences.pgsDirectPlay)
            )
            SettingsToggleButton(
                icon: "doc.text",
                heading: Strings.settingsSubtitlesScreenAssSsaDirectPlay,
                caption: Strings.settingsSubtitlesScreenEnableDirectPlayForAssSsa,
                isOn: prefs.binding(for: UserPreferences.assDirectPlay)
            )
        }
        .restoresFocus($focusedRoute)
    }
}

struct SettingsSubtitleCustomizationScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsSubtitlesScreenSubtitleCustomization) {
            SubtitlePreview(
                textColor: prefs[UserPreferences.subtitlesTextColor],
                backgroundColor: prefs[UserPreferences.subtitlesBackgroundColor],
                strokeColor: prefs[UserPreferences.subtitlesStrokeColor],
                textSize: prefs[UserPreferences.subtitlesTextSize]
            )

            SettingsListButton(
                icon: "textformat",
                heading: Strings.settingsSubtitlesScreenTextColor,
                caption: prefs[UserPreferences.subtitlesTextColor].displayName,
                action: { settingsRouter.navigate(to: .customizationSubtitlesTextColor) }
            )
            .focused($focusedRoute, equals: .customizationSubtitlesTextColor)

            SettingsListButton(
                icon: "rectangle.fill",
                heading: Strings.settingsSubtitlesScreenBackgroundColor,
                caption: prefs[UserPreferences.subtitlesBackgroundColor].displayName,
                action: { settingsRouter.navigate(to: .customizationSubtitlesBackgroundColor) }
            )
            .focused($focusedRoute, equals: .customizationSubtitlesBackgroundColor)

            SettingsListButton(
                icon: "square.dashed",
                heading: Strings.settingsSubtitlesScreenEdgeColor,
                caption: prefs[UserPreferences.subtitlesStrokeColor].displayName,
                action: { settingsRouter.navigate(to: .customizationSubtitlesEdgeColor) }
            )
            .focused($focusedRoute, equals: .customizationSubtitlesEdgeColor)

            SettingsListButton(
                icon: "textformat.size",
                heading: Strings.settingsSubtitlesScreenTextSize,
                caption: Strings.settingsSubtitlesScreenFontSizeForSubtitles,
                trailingText: "\(prefs[UserPreferences.subtitlesTextSize])pt",
                action: { settingsRouter.navigate(to: .customizationSubtitlesTextSize) }
            )
            .focused($focusedRoute, equals: .customizationSubtitlesTextSize)

            SettingsListButton(
                icon: "arrow.up.and.down",
                heading: Strings.settingsSubtitlesScreenOffsetPosition,
                caption: Strings.settingsSubtitlesScreenDistanceFromBottomEdge,
                trailingText: "\(prefs[UserPreferences.subtitlesOffsetPosition])%",
                action: { settingsRouter.navigate(to: .customizationSubtitlesOffset) }
            )
            .focused($focusedRoute, equals: .customizationSubtitlesOffset)
        }
        .restoresFocus($focusedRoute)
    }
}

private struct SubtitlePreview: View {
    let textColor: SubtitleColor
    let backgroundColor: SubtitleColor
    let strokeColor: SubtitleColor
    let textSize: Int

    @EnvironmentObject var theme: MoonfinTheme

    private var previewFontSize: CGFloat {
        CGFloat(max(14, min(textSize, 32)))
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: RadiusTokens.small, style: .continuous)
                .fill(Color.black.opacity(0.85))
                .frame(height: 120)

            Text(Strings.settingsSubtitlesScreenSampleSubtitleText)
                .font(.system(size: previewFontSize, weight: .medium))
                .foregroundColor(textColor.swiftUIColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(backgroundColor.swiftUIColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(strokeColor.isTransparent ? .clear : strokeColor.swiftUIColor, lineWidth: 2)
                )
        }
        .padding(.horizontal, SpaceTokens.spaceMd)
        .padding(.bottom, SpaceTokens.spaceSm)
    }
}
