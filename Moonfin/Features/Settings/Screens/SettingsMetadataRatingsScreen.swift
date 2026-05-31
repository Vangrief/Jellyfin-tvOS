import SwiftUI

struct SettingsMetadataRatingsScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var settingsRouter: SettingsRouter

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsMetadataRatingsScreenMetadataAndRatings) {
            SettingsToggleButton(
                icon: "star.fill",
                heading: Strings.settingsMetadataRatingsScreenAdditionalRatings,
                caption: Strings.settingsMetadataRatingsScreenAdditionalRatingsCaption,
                isOn: prefs.binding(for: UserPreferences.enableAdditionalRatings)
            )

            SettingsListButton(
                icon: "arrow.left.arrow.right",
                heading: Strings.settingsMetadataRatingsScreenRatingSources,
                caption: Strings.settingsMetadataRatingsScreenRatingSourcesCaption,
                action: { settingsRouter.navigate(to: .integrationsRatingSources) }
            )

            SettingsToggleButton(
                icon: "tv",
                heading: Strings.settingsMetadataRatingsScreenEpisodeRatings,
                caption: Strings.settingsMetadataRatingsScreenEpisodeRatingsCaption,
                isOn: prefs.binding(for: UserPreferences.enableEpisodeRatings)
            )

            SettingsToggleButton(
                icon: "tag.fill",
                heading: Strings.settingsMetadataRatingsScreenRatingLabels,
                caption: Strings.settingsMetadataRatingsScreenRatingLabelsCaption,
                isOn: prefs.binding(for: UserPreferences.showRatingLabels)
            )

            SettingsToggleButton(
                icon: "rosette",
                heading: Strings.settingsMetadataRatingsScreenRatingBadges,
                caption: Strings.settingsMetadataRatingsScreenRatingBadgesCaption,
                isOn: prefs.binding(for: UserPreferences.showRatingBadges)
            )
        }
    }
}

struct SettingsRatingSourcesScreen: View {
    @EnvironmentObject var container: AppContainer
    @EnvironmentObject var theme: MoonfinTheme

    @State private var rows: [RatingSourceRow] = []

    private var prefs: UserPreferences { container.userPreferences }

    var body: some View {
        SettingsScreenLayout(title: Strings.settingsMetadataRatingsScreenRatingSources) {
            Text(Strings.settingsMetadataRatingsScreenPressToRearrange)
                .font(.caption)
                .foregroundColor(theme.colorScheme.listCaption)
                .padding(.bottom, SpaceTokens.space2xs)

            ForEach(Array(rows.enumerated()), id: \.element.id) { index, row in
                RatingSourceItem(
                    row: row,
                    isFirst: index == 0,
                    isLast: index == rows.count - 1,
                    onToggle: { toggleRow(at: index) },
                    onMoveUp: { moveRow(from: index, direction: -1) },
                    onMoveDown: { moveRow(from: index, direction: 1) }
                )
            }

            Button(action: resetToDefaults) {
                FocusAwareActionLabel(icon: "arrow.counterclockwise", text: Strings.settingsResetToDefaults)
            }
            .buttonStyle(CleanButtonStyle())
            .padding(.top, SpaceTokens.spaceMd)
        }
        .onAppear { loadRows() }
    }

    private func loadRows() {
        let enabledOrder = RatingSource.canonicalEnabledSourceOrder(prefs[UserPreferences.enabledRatings])
        let enabledSet = Set(enabledOrder)
        let orderedSources = orderedSourcesForDisplay(enabledOrder: enabledOrder)

        rows = orderedSources.enumerated().map { index, source in
            RatingSourceRow(source: source, enabled: enabledSet.contains(source.rawValue), order: index)
        }
    }

    private func saveRows() {
        let enabledInOrder = RatingSource.canonicalEnabledSourceOrder(rows
            .enumerated()
            .sorted { $0.offset < $1.offset }
            .map(\.element)
            .filter(\.enabled)
            .map { $0.source.rawValue })
        prefs[UserPreferences.enabledRatings] = enabledInOrder
    }

    private func orderedSourcesForDisplay(enabledOrder: [String]) -> [SettingsRatingSource] {
        let defaults = SettingsRatingSource.defaultOrder.map(\.rawValue)
        let orderedRaw = enabledOrder + defaults.filter { !enabledOrder.contains($0) }

        var seen = Set<String>()
        return orderedRaw.compactMap { raw in
            let canonical = RatingSource.canonicalSourceRawValue(raw)
            guard seen.insert(canonical).inserted else { return nil }
            return SettingsRatingSource(rawValue: canonical)
        }
    }

    private func toggleRow(at index: Int) {
        rows[index].enabled.toggle()
        saveRows()
    }

    private func moveRow(from index: Int, direction: Int) {
        let target = index + direction
        guard target >= 0 && target < rows.count else { return }
        rows.swapAt(index, target)
        saveRows()
    }

    private func resetToDefaults() {
        rows = SettingsRatingSource.defaultOrder.enumerated().map { index, source in
            RatingSourceRow(source: source, enabled: true, order: index)
        }
        saveRows()
    }
}

private struct RatingSourceRow: Identifiable {
    let source: SettingsRatingSource
    var enabled: Bool
    var order: Int

    var id: String { source.rawValue }
}

private struct RatingSourceItem: View {
    let row: RatingSourceRow
    let isFirst: Bool
    let isLast: Bool
    let onToggle: () -> Void
    let onMoveUp: () -> Void
    let onMoveDown: () -> Void

    @EnvironmentObject var theme: MoonfinTheme

    var body: some View {
        Button(action: onToggle) {
            SettingsItemContent(
                icon: "star",
                heading: row.source.displayName,
                caption: nil
            ) { isFocused in
                HStack(spacing: SpaceTokens.spaceSm) {
                    if !isFirst {
                        Image(systemName: "chevron.up")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption)
                    }
                    if !isLast {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption)
                    }
                    Image(systemName: row.enabled ? "checkmark.circle.fill" : "circle")
                        .font(.bodyLg)
                        .foregroundColor(row.enabled
                            ? (isFocused ? theme.colorScheme.listHeadlineFocused : theme.accent)
                            : (isFocused ? theme.colorScheme.listCaptionFocused : theme.colorScheme.listCaption))
                }
            }
        }
        .buttonStyle(CleanButtonStyle())
        .onMoveCommand { direction in
            switch direction {
            case .left: onMoveUp()
            case .right: onMoveDown()
            default: break
            }
        }
    }
}
