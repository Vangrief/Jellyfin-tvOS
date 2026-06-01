import SwiftUI

struct SettingsLibrariesScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    var body: some View {
        SettingsScreenLayout(title: Strings.libraries) {
            SettingsListButton(
                icon: "eye",
                heading: Strings.settingsLibraryVisibility,
                caption: Strings.settingsLibraryVisibilitySummary,
                action: { settingsRouter.navigate(to: .librariesVisibility) }
            )
            .focused($focusedRoute, equals: .librariesVisibility)

            SettingsToggleButton(
                icon: "folder",
                heading: Strings.settingsLibrariesScreenEnableFolderView,
                caption: Strings.settingsLibrariesScreenEnableFolderViewCaption,
                isOn: container.userPreferences.binding(for: UserPreferences.enableFolderView)
            )

            SettingsToggleButton(
                icon: "network",
                heading: Strings.settingsLibrariesScreenMultiServerLibraries,
                caption: Strings.settingsLibrariesScreenMultiServerLibrariesCaption,
                isOn: container.userPreferences.binding(for: UserPreferences.enableMultiServerLibraries)
            )
        }
        .restoresFocus($focusedRoute)
    }
}
