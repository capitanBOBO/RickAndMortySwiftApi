import Foundation

/**
Rick and Morty Episode model
- Parameters:
    - id: The id of the episode (Int?). 
    - name: The name of the episode (String?).
    - airDate: The air date of the episode (String?).
    - episode: The code of the episode, ex. "S01E01" (String?).
    - charactes: List of characters who have been seen in the episode ([String]?).
    - url: Link to the episode's own endpoint (String?).
    - created: Time at which the episode was created in the database, ex. "2017-11-10T12:56:33.798Z" (String?).
*/
public struct RAMEpisodeModel: Codable {

    /// The id of the episode
    public let id: Int?
    
    /// The name of the episode
    public let name: String?

    /// The air date of the episode
    public let airDate: String?

    /// The code of the episode, ex. "S01E01"
    public let episode: String?

    /// List of characters who have been seen in the episode
    public let charactes: [String]?

    /// Link to the episode's own endpoint
    public let url: String?

    /// Time at which the episode was created in the database, ex. "2017-11-10T12:56:33.798Z"
    public let created: String?

    enum CodinigKeys: String, CodingKey {
        case id, name, episode, charactes, url, created
        case airDate = "air_date"
    }
}
