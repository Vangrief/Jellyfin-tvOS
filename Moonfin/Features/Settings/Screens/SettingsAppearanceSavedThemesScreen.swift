import SwiftUI

struct SettingsAppearanceSavedThemesScreen: View {
    @EnvironmentObject private var container: AppContainer
    @EnvironmentObject private var theme: MoonfinTheme

    @State private var savedThemes: [SavedThemeEntry] = []
    @State private var isLoading = false
    @State private var deletingThemeId: String?
    @State private var statusMessage: String?
    @State private var pendingDelete: SavedThemeEntry?

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsAppearanceSavedThemesScreenTitle) {
            Text(Strings.settingsAppearanceSavedThemesScreenDescription)
                .font(.captionXs)
                .foregroundColor(theme.colorScheme.listCaption)
                .padding(.horizontal, SpaceTokens.spaceMd)
                .padding(.bottom, SpaceTokens.spaceSm)

            if let statusMessage {
                Text(statusMessage)
                    .font(.captionXs)
                    .foregroundColor(theme.colorScheme.listCaption)
                    .padding(.horizontal, SpaceTokens.spaceMd)
                    .padding(.bottom, SpaceTokens.spaceXs)
            }

            if isLoading {
                HStack(spacing: SpaceTokens.spaceSm) {
                    ProgressView()
                        .progressViewStyle(.circular)
                    Text(Strings.settingsAppearanceSavedThemesScreenLoading)
                        .font(.captionXs)
                        .foregroundColor(theme.colorScheme.listCaption)
                }
                .padding(.horizontal, SpaceTokens.spaceMd)
                .padding(.vertical, SpaceTokens.spaceSm)
            }

            if !isLoading && savedThemes.isEmpty {
                Text(Strings.settingsAppearanceSavedThemesScreenEmpty)
                    .font(.captionXs)
                    .foregroundColor(theme.colorScheme.listCaption)
                    .padding(.horizontal, SpaceTokens.spaceMd)
                    .padding(.vertical, SpaceTokens.spaceSm)
            }

            ForEach(savedThemes) { entry in
                Button {
                    pendingDelete = entry
                } label: {
                    SettingsItemContent(
                        icon: "square.and.arrow.down",
                        heading: entry.displayName,
                        caption: entry.id
                    ) { isFocused in
                        if deletingThemeId == entry.id {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(0.8)
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .font(.bodyMd)
                                .foregroundColor(
                                    isFocused ? theme.colorScheme.listHeadlineFocused : Color.red
                                )
                        }
                    }
                }
                .buttonStyle(CleanButtonStyle())
                .disabled(deletingThemeId != nil)
            }
        }
        .task {
            reloadSavedThemes()
        }
        .alert(item: $pendingDelete) { entry in
            Alert(
                title: Text(Strings.settingsAppearanceSavedThemesScreenDeleteTitle),
                message: Text(Strings.settingsAppearanceSavedThemesScreenDeleteMessage(entry.displayName)),
                primaryButton: .destructive(Text(Strings.delete)) {
                    deleteTheme(entry)
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func reloadSavedThemes() {
        isLoading = true
        savedThemes = container.pluginSyncService.listSavedThemes()
        isLoading = false
    }

    private func deleteTheme(_ entry: SavedThemeEntry) {
        deletingThemeId = entry.id

        let deleted = container.pluginSyncService.deleteSavedTheme(themeId: entry.id)
        statusMessage = deleted
            ? Strings.settingsAppearanceSavedThemesScreenDeletedStatus(entry.displayName)
            : Strings.settingsAppearanceSavedThemesScreenDeleteFailedStatus(entry.displayName)

        reloadSavedThemes()
        deletingThemeId = nil
    }
}
