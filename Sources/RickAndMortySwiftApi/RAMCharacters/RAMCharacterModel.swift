import Foundation

/**
Rick and Morty API Character location model
```
// Parameters:
//    name : String? - The name of the characters location.
//    url  : String? - The url of the characters location.
```
*/
public struct RAMCharacterLocationModel: Codable {
    public let name: String?
    public let url: String?
}

/**
Rick and Morty API Character model
```
// Parameters:
//   id       : Int?      - The id of the character.
//   name     : String?   - The name of the character.
//   status   : String?   - The status of the character ('Alive', 'Dead' or 'unknown').
//   species  : String?   - The species of the character.
//   type     : String?   - The type or subspecies of the character.
//   gender   : String?   - The gender of the character.
//   origin   : String?   - Name and link to the character's origin location.
//   location : String?   - Name and link to the character's last known location endpoint.
//   image    : String?   - Link to the character's image.
//                          All images are 300x300px and most are medium shots
//                          or portraits since they are intended to be used as avatars.
//   episode  : [String]? - List of episodes in which this character appeared.
//   url      : String?   - Link to the character's own URL endpoint.
//   created  : String?   - Time at which the character was created in the database,
//                          ex. 2017-11-04T18:48:46.250Z.
```
*/
public struct RAMCharacterModel: Codable {
    /// The id of the character.
    public let id: Int?
    /// The name of the character.
    public let name: String?
    /// The status of the character ('Alive', 'Dead' or 'unknown').
    public let status: String?
    /// The species of the character.
    public let species: String?
    /// The type or subspecies of the character.
    public let type: String?
    /// The type or subspecies of the character.
    public let gender: String?
    /// Name and link to the character's origin location.
    public let origin: RAMCharacterLocationModel?
    /// Name and link to the character's last known location endpoint.
    public let location: RAMCharacterLocationModel?
    /// Link to the character's image. All images are 300x300px and most are medium or portraits since they are intended to be used as avatars.
    public let image: String?
    /// List of episodes in which this character appeared.
    public let episode: [String]?
    /// Link to the character's own URL endpoint.
    public let url: String?
    /// Time at which the character was created in the database, ex. 2017-11-04T18:48:46.250Z.
    public let created: String?
}
