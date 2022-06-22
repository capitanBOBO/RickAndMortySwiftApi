import Foundation

/// Rick and Morty Episode model
/// - Parameter episode: episode code, ex. "S01E01"
/// - Parameter charactes: list of character urls
/// - Parameter created: time of creation in database
public struct RAMEpisodeModel: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let charactes: [String]?
    let url: String?
    let created: String?

    enum CodinigKeys: String, CodingKey {
        case airDate = "air_date"
    }
}
