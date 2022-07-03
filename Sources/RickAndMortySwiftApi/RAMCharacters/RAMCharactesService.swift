import Foundation

enum RAMCharacterBasePath: RAMBasePath {
    static let basePath: String = "character"
}

public struct RAMCharacterFilter: RAMFilter {
    public let name: String?
    public let status: String?
    public let species: String?
    public let type: String?
    public let gender: String?

    public var query: String {
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

public protocol RAMCharactersService {
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getCharacter(id: UInt, completion: @escaping (Result<RAMCharacterModel?, Error>)->()) -> URLSessionTask?
    @discardableResult func getCharacters(ids: [UInt], completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getCharacters(filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask?
}

struct RAMCharactesServiceRealisation: RAMCharactersService {
    private typealias RAMServiceAlias = RAMService<RAMCharacterModel, RAMCharacterFilter, RAMCharacterBasePath>
    private let service: RAMServiceAlias
    init(networkService: RAMNetworkServiceInterface) {
        service = RAMServiceAlias(networkService)
    }

    @discardableResult public func getAll(page: UInt, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getAllItems(page: page, completion: completion)
    }

    @discardableResult public func getCharacter(id: UInt, completion: @escaping (Result<RAMCharacterModel?, Error>)->()) -> URLSessionTask? {
        return service.getItem(id: id, completion: completion)
    }

    @discardableResult public func getCharacters(ids: [UInt], completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(ids: ids, completion: completion)
    }

    @discardableResult public func getCharacters(filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(filter: filter, completion: completion)
    }
}
