import Foundation

/**
 Characters request filter
 - Parameters:
     - name: Character name (String?).
     - status: Character status ('Alive', 'Dead' or 'unknown') (String?).
     - species: Character species (String?).
     - type: Character type (String?).
     - gender: Character gender (String?).
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
    ~~~
    RAMCharacterFilter(name: "Rick", species: "Human")
    
    // "?name=Rick&status=Human"
    ~~~
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

/**
Characters service. Allows to request all characters or characters by id/filter
*/
public protocol RAMCharactersService {

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
        - filter: characters filter ~~~RAMCharacterFilter~~~
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getCharacters(filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?
}

