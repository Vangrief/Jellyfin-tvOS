import SwiftUI

struct SettingsDynamicContentScreen: View {
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsDynamicContentScreenTitle) {
            SettingsListButton(
                icon: "rectangle.inset.filled",
                heading: Strings.settingsDynamicContentScreenMediaBar,
                caption: Strings.settingsDynamicContentScreenMediaBarCaption,
                action: { settingsRouter.navigate(to: .dynamicContentMediaBar) }
            )
            .focused($focusedRoute, equals: .dynamicContentMediaBar)

            SettingsListButton(
                icon: "play.rectangle",
                heading: Strings.settingsDynamicContentScreenLocalPreviews,
                caption: Strings.settingsDynamicContentScreenLocalPreviewsCaption,
                action: { settingsRouter.navigate(to: .dynamicContentLocalPreviews) }
            )
            .focused($focusedRoute, equals: .dynamicContentLocalPreviews)

            SettingsListButton(
                icon: "sparkles",
                heading: Strings.settingsDynamicContentScreenSeasonalEffects,
                caption: Strings.settingsDynamicContentScreenSeasonalEffectsCaption,
                action: { settingsRouter.navigate(to: .dynamicContentSeasonalEffects) }
            )
            .focused($focusedRoute, equals: .dynamicContentSeasonalEffects)
        }
        .restoresFocus($focusedRoute)
    }
}
