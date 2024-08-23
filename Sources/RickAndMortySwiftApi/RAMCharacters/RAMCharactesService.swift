import Foundation

/**
 Characters request filter
```
// Parameters:
//    name    : String? - Character name.
//    status  : String? - Character status ('Alive', 'Dead' or 'unknown').
//    species : String? - Character species.
//    type    : String? - Character type.
//    gender  : String? - Character gender.
```
*/
public struct RAMCharacterFilter: RAMFilter {
    /// Character name
    public let name: String?
    /// Character status ('Alive', 'Dead' or 'unknown')
    public let status: String?
    /// Character species
    public let species: String?
    /// Character type
    public let type: String?
    /// Character gender
    public let gender: String?

    /**
    Query for request.
    ```
    RAMCharacterFilter(name: "Rick", species: "Human")
    
    // "?name=Rick&status=Human"
    ```
    */
    var query: String {
        var result = "?"
        if let name = name {
            result += "name=\(name)"
        }
        if let status = status {
            if result != "?" { result += "&" }
            result += "status=\(status)"
        }
        if let species = species {
            if result != "?" { result += "&" }
            result += "species=\(species)"
        }
        if let type = type {
            if result != "?" { result += "&" }
            result += "type=\(type)"
        }
        if let gender = gender {
            if result != "?" { result += "&" }
            result += "gender=\(gender)"
        }
        return result
    }

    /**
    Init a new characters filter
    - Parameters:
        - name: Characters name 
        - status: ... status ('Alive', 'Dead' or 'unknown')
        - species: ... species
        - type: ... type
        - gender: ... gender

    - Returns: A new characters filter for request
    */
    public init(
        name: String? = nil,
        status: String? = nil,
        species: String? = nil,
        type: String? = nil,
        gender: String? = nil
    ) {
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
    }
}

/// Characters service. Allows to request all characters or characters by id/filter
public protocol RAMCharactersService {
    
    /// Requests all characters for specific page (async/await)
    /// - Parameter page: characters list page, start with 1
    /// - Returns: array of `RAMCharacterModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMCharacterModel]
    
    /// Request character by id (async/await)
    /// - Parameter id: character id
    /// - Returns: `RAMCharacterModel`(optional)
    @available(iOS 13.0, macOS 12.0, *)
    func getCharacter(id: UInt) async throws -> RAMCharacterModel?
    
    /// Requests characters by ids
    /// - Parameter ids: array of charater ids
    /// - Returns: array of `RAMCharactermodel`
    @available(iOS 13.0, macOS 12.0, *)
    func getCharacters(ids: [UInt]) async throws -> [RAMCharacterModel]
    
    /// Requests characters by filter
    /// - Parameters:
    ///   - page: characters list page, start with 1
    ///   - filter: characters filter `RAMCharacterFilter`
    /// - Returns: array of `RAMCharacterModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getCharacters(page: UInt, filter: RAMCharacterFilter) async throws -> [RAMCharacterModel]

    /**
    Requests all characters for specific page
    - Parameters:
        - page: characters list page, start with 1
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?

    /**
    Requests character by id
    - Parameters:
        - id: character id
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getCharacter(id: UInt, completion: @escaping (Result<RAMCharacterModel?, Error>)->()) -> URLSessionTask?

    /**
    Requests characters by ids
    - Parameters:
        - ids: array of characters ids
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getCharacters(ids: [UInt], completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?

    /**
    Requests characters by filter
    - Parameters:
        - filter: characters filter `RAMCharacterFilter`
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getCharacters(page: UInt, filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?
}

