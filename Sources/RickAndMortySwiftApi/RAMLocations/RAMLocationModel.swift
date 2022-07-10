import Foundation

/// Rick and Morty API Location model
/// - Parameter id: The id of the location (Int?). 
/// - Parameter name: The name of the location (String?).
/// - Parameter type: The type of the location (String?).
/// - Parameter dimension: The dimension in which the location is located (String?).
/// - Parameter residents: List of character who have been last seen in the location ([String]?).
/// - Parameter url: Link to the location's own endpoint (String?).
/// - Parameter created: Time at which the location was created in the database, ex. "2017-11-10T12:42:04.162Z" (String?).
public struct RAMLocationModel: Codable {
    public let id: Int?
    public let name: String?
    public let type: String?
    public let dimension: String?
    public let residents: [String]?
    public let url: String?
    public let created: String?
}
