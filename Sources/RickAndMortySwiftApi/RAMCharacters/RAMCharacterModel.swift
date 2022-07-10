import Foundation

/**
Rick and Morty API Character location model
- Parameters:
    - name: The name of the characters location (String?).
    - url: The url of the characters location (String?).
*/
public struct RAMCharacterLocationModel: Codable {
    public let name: String?
    public let url: String?
}

/**
Rick and Morty API Character model
 - Parameters:
    - id: The id of the character (Int?).
    - name: The name of the character (String?).
    - status: The status of the character ('Alive', 'Dead' or 'unknown') (String?).
    - species: The species of the character (String?).
    - type: The type or subspecies of the character (String?).
    - gender: The type or subspecies of the character (String?).
    - origin: Name and link to the character's origin location (RAMCharacterLocationModel?).
    - location: Name and link to the character's last known location endpoint (RAMCharacterLocationModel?).
    - image: Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars (String?).
    - episode: List of episodes in which this character appeared ([String]?).
    - url: Link to the character's own URL endpoint (String?).
    - created: Time at which the character was created in the database, ex. 2017-11-04T18:48:46.250Z (String?).
*/
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
