import Foundation

/**
 Rick and Morty API Location model
```
// Parameter 
//    id        : Int?      - The id of the location. 
//    name      : String?   - The name of the location.
//    type      : String?   - The type of the location.
//    dimension : String?   - The dimension in which the location is located.
//    residents : [String]? - List of character who have been last seen in the location.
//    url       : String?   - Link to the location's own endpoint.
//    created   : String?   - Time at which the location was created in the database, ex. "2017-11-10T12:42:04.162Z".
```
*/
public struct RAMLocationModel: Codable {

    /// The id of the location.
    public let id: Int?

    /// The name of the location.
    public let name: String?

    /// The type of the location.
    public let type: String?

    /// The dimension in which the location is located.
    public let dimension: String?

    /// List of character who have been last seen in the location.
    public let residents: [String]?

    /// Link to the location's own endpoint.
    public let url: String?

    /// Time at which the location was created in the database, ex. "2017-11-10T12:42:04.162Z".
    public let created: String?
}
