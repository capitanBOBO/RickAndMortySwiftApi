import Foundation

/// Characters request base path `character`.
enum RAMCharacterBasePath: RAMBasePath {
    static let basePath: String = "character"
}

/// RAMCharactersService realisation
struct RAMCharactesServiceImp: RAMCharactersService {
    private typealias RAMServiceAlias = RAMService<RAMCharacterModel, RAMCharacterFilter, RAMCharacterBasePath>
    private let service: RAMServiceAlias
    /**
    Initialization of service
    - Parameters:
        - networkService: network service for requests `RAMNetworkServiceInterface`

    - Returns: Characters service
    */
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
