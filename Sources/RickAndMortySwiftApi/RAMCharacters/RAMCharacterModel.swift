import Foundation

/// Rick and Morty API Character location model
public struct RAMCharacterLocationModel: Codable {
    let name: String?
    let url: String?
}

/// Rick and Morty API Character model
/// - Parameter origin: name and link to the character's origin location.
/// - Parameter image: link to the character's image. All images are 300x300px
/// - Parameter episode: list of episodes urls
/// - Parameter created: time of creation in database
public struct RAMCharaterModel: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: RAMCharacterLocationModel?
    let locatiion: RAMCharacterLocationModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
