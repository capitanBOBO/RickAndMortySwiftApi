import Foundation

/**
Rick and Morty Episode model
```
// Parameters:
//    id        : Int?      - The id of the episode. 
//    name      : String?   - The name of the episode.
//    airDate   : String?   - The air date of the episode.
//    episode   : String?   - The code of the episode, ex. "S01E01".
//    charactes : [String]? - List of characters who have been seen in the episode.
//    url       : String?   - Link to the episode's own endpoint.
//    created   : String?   - Time at which the episode was created in the database, ex. "2017-11-10T12:56:33.798Z" .
```
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
