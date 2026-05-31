import SwiftUI

struct PauseDescriptionOverlay: View {
    let title: String?
    let description: String?
    let mediaType: ItemType
    let logoUrl: String?
    @EnvironmentObject var theme: MoonfinTheme
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: SpaceTokens.spaceMd) {
                HStack {
                    VStack(alignment: .leading, spacing: SpaceTokens.spaceSm) {
                        if let title = title {
                            Text(title)
                                .font(.titleMd)
                                .fontWeight(.semibold)
                                .foregroundColor(theme.colorScheme.onBackground)
                                .lineLimit(2)
                        }

                        HStack(spacing: SpaceTokens.spaceSm) {
                            Text(mediaType.displayName)
                                .font(.captionXs)
                                .foregroundColor(theme.colorScheme.onBackground.opacity(0.6))

                            Text("Paused")
                                .font(.captionXs)
                                .foregroundColor(theme.colorScheme.onBackground.opacity(0.6))
                        }
                    }

                    Spacer()

                    if let logoUrl = logoUrl, let url = URL(string: logoUrl) {
                        CachedImage(url: url, contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(RadiusTokens.small)
                    }
                }

                if let description = description, !description.isEmpty {
                    Divider()
                        .background(theme.colorScheme.onBackground.opacity(0.2))

                    ScrollView(.vertical, showsIndicators: false) {
                        Text(description)
                            .font(.bodyMd)
                            .foregroundColor(theme.colorScheme.onBackground.opacity(0.8))
                            .lineLimit(nil)
                    }
                    .frame(maxHeight: 200)
                }

                HStack(spacing: SpaceTokens.spaceLg) {
                    Spacer()

                    Button(action: onDismiss) {
                        Text("Resume")
                            .font(.bodyMd)
                            .fontWeight(.semibold)
                            .padding(.horizontal, SpaceTokens.spaceLg)
                            .padding(.vertical, SpaceTokens.spaceMd)
                            .background(theme.colorScheme.buttonFocused)
                            .foregroundColor(theme.colorScheme.onButton)
                            .cornerRadius(RadiusTokens.medium)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(SpaceTokens.spaceLg)
            .frame(maxWidth: 700)
        }
        .transition(.opacity)
    }
}

extension ItemType {
    var displayName: String {
        switch self {
        case .movie: return "Movie"
        case .series: return "Series"
        case .episode: return "Episode"
        case .season: return "Season"
        case .person: return "Person"
        case .boxSet: return "Collection"
        case .book: return "Book"
        case .musicAlbum: return "Album"
        case .musicArtist: return "Artist"
        case .audio: return "Audio"
        case .playlist: return "Playlist"
        case .trailer: return "Trailer"
        case .video: return "Video"
        default: return "Media"
        }
    }
}
