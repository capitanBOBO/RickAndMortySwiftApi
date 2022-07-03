import Foundation

/// Rick and Morty API Character location model
public struct RAMCharacterLocationModel: Codable {
    public let name: String?
    public let url: String?
}

/// Rick and Morty API Character model
/// - Parameter origin: name and link to the character's origin location.
/// - Parameter image: link to the character's image. All images are 300x300px
/// - Parameter episode: list of episodes urls
/// - Parameter created: time of creation in database
public struct RAMCharacterModel: Codable {
    public let id: Int?
    public let name: String?
    public let status: String?
    public let species: String?
    public let type: String?
    public let gender: String?
    public let origin: RAMCharacterLocationModel?
    public let location: RAMCharacterLocationModel?
    public let image: String?
    public let episode: [String]?
    public let url: String?
    public let created: String?
}
