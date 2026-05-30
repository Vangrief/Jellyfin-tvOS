import SwiftUI

struct SettingsLibrariesScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter
    @FocusState private var focusedRoute: SettingsRoute?

    var body: some View {
        SettingsScreenLayout(title: "Libraries") {
            SettingsListButton(
                icon: "eye",
                heading: Strings.settingsLibraryVisibility,
                caption: Strings.settingsLibraryVisibilitySummary,
                action: { settingsRouter.navigate(to: .librariesVisibility) }
            )
            .focused($focusedRoute, equals: .librariesVisibility)

            SettingsToggleButton(
                icon: "folder",
                heading: "Enable Folder View",
                caption: "Show folder browsing mode option",
                isOn: container.userPreferences.binding(for: UserPreferences.enableFolderView)
            )

            SettingsToggleButton(
                icon: "network",
                heading: "Multi-Server Libraries",
                caption: "Aggregate libraries from all servers",
                isOn: container.userPreferences.binding(for: UserPreferences.enableMultiServerLibraries)
            )
        }
        .restoresFocus($focusedRoute)
    }
}
