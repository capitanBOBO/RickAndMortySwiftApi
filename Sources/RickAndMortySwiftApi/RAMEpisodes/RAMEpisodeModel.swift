import Foundation

/// Rick and Morty Episode model
/// - Parameter episode: episode code, ex. "S01E01"
/// - Parameter charactes: list of character urls
/// - Parameter created: time of creation in database
public struct RAMEpisodeModel: Codable {
    public let id: Int?
    public let name: String?
    public let airDate: String?
    public let episode: String?
    public let charactes: [String]?
    public let url: String?
    public let created: String?

    enum CodinigKeys: String, CodingKey {
        case airDate = "air_date"
    }
}
