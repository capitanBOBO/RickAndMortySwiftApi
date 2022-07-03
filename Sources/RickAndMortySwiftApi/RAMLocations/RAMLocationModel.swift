import Foundation

/// Rick and Morty API Location model
/// - Parameter residents: list of characters urls
/// - Parameter created: time of creation in database
public struct RAMLocationModel: Codable {
    public let id: Int?
    public let name: String?
    public let type: String?
    public let dimension: String?
    public let residents: [String]?
    public let url: String?
    public let created: String?
}
