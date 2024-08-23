import Foundation

/// Characters request base path `character`.
enum RAMCharacterBasePath: RAMBasePath {
    static let basePath: String = "character"
}

/// RAMCharactersService realisation
final class RAMCharactesServiceImp: RAMCharactersService {
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

    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMCharacterModel] {
        return try await service.getAllItems(page: page)
    }

    @available(iOS 13.0, macOS 12.0, *)
    func getCharacter(id: UInt) async throws -> RAMCharacterModel? {
        return try await service.getItem(id: id)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getCharacters(ids: [UInt]) async throws -> [RAMCharacterModel] {
        return try await service.getItems(ids: ids)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getCharacters(page: UInt, filter: RAMCharacterFilter) async throws -> [RAMCharacterModel] {
        return try await service.getItems(page: page, filter: filter)
    }

    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getAllItems(page: page, completion: completion)
    }
    

    @discardableResult func getCharacter(id: UInt, completion: @escaping (Result<RAMCharacterModel?, Error>)->()) -> URLSessionTask? {
        return service.getItem(id: id, completion: completion)
    }

    @discardableResult func getCharacters(ids: [UInt], completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(ids: ids, completion: completion)
    }

    @discardableResult func getCharacters(page: UInt, filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(page: page, filter: filter, completion: completion)
    }
}
