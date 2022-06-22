import Foundation

/// Rick and Morty API Location model
/// - Parameter residents: list of characters urls
/// - Parameter created: time of creation in database
public struct RAMLocationModel: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
