import Foundation

enum MediaSegmentType: String, Codable {
    case unknown = "Unknown"
    case commercial = "Commercial"
    case preview = "Preview"
    case recap = "Recap"
    case outro = "Outro"
    case intro = "Intro"

    static let supported: [MediaSegmentType] = [.intro, .outro, .preview, .recap, .commercial]

    @MainActor
    var displayName: String {
        switch self {
        case .unknown: return Strings.mediaSegmentModelsTypeUnknown
        case .commercial: return Strings.mediaSegmentModelsTypeCommercial
        case .preview: return Strings.mediaSegmentModelsTypePreview
        case .recap: return Strings.mediaSegmentModelsTypeRecap
        case .outro: return Strings.mediaSegmentModelsTypeOutro
        case .intro: return Strings.mediaSegmentModelsTypeIntro
        }
    }

    @MainActor
    var skipLabel: String {
        switch self {
        case .unknown: return Strings.mediaSegmentModelsSkip
        case .commercial: return Strings.skipCommercial
        case .preview: return Strings.skipPreview
        case .recap: return Strings.skipRecap
        case .outro: return Strings.skipOutro
        case .intro: return Strings.skipIntro
        }
    }
}

enum MediaSegmentAction: String, StringRepresentableEnum, CaseIterable {
    case nothing
    case skip
    case askToSkip

    @MainActor
    var displayName: String {
        switch self {
        case .nothing: return Strings.mediaSegmentModelsActionNothing
        case .skip: return Strings.mediaSegmentModelsSkip
        case .askToSkip: return Strings.mediaSegmentModelsActionAskToSkip
        }
    }
}

struct MediaSegmentDto: Codable, Identifiable {
    let id: String
    let itemId: String
    let type: MediaSegmentType
    let startTicks: Int64
    let endTicks: Int64

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case itemId = "ItemId"
        case type = "Type"
        case startTicks = "StartTicks"
        case endTicks = "EndTicks"
    }

    var startSeconds: TimeInterval { TimeInterval(startTicks) / 10_000_000.0 }
    var endSeconds: TimeInterval { TimeInterval(endTicks) / 10_000_000.0 }
    var durationSeconds: TimeInterval { max(endSeconds - startSeconds, 0) }
}

struct MediaSegmentQueryResult: Codable {
    let items: [MediaSegmentDto]
    let totalRecordCount: Int
    let startIndex: Int

    enum CodingKeys: String, CodingKey {
        case items = "Items"
        case totalRecordCount = "TotalRecordCount"
        case startIndex = "StartIndex"
    }
}
