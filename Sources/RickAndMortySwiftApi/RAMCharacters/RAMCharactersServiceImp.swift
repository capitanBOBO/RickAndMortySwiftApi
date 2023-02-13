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

    @discardableResult public func getCharacters(page: UInt, filter: RAMCharacterFilter, completion: @escaping (Result<[RAMCharacterModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(page: page, filter: filter, completion: completion)
    }

    @available(iOS 15, macOS 12, *)
    public func getAll(page: UInt) async throws -> [RAMCharacterModel] {
        return try await withCheckedThrowingContinuation { (cont: CheckedContinuation<[RAMCharacterModel], Error>) in
            service.getAllItems(page: page) { cont.resume(with: $0) }
        }
    }
    @available(iOS 15, macOS 12, *)
    public func getCharacter(id: UInt) async throws -> RAMCharacterModel? {
        return try await withCheckedThrowingContinuation { (cont: CheckedContinuation<RAMCharacterModel?, Error>) in
            service.getItem(id: id) { cont.resume(with: $0) }
        }
    }
    @available(iOS 15, macOS 12, *)
    public func getCharacters(ids: [UInt]) async throws -> [RAMCharacterModel] {
        return try await withCheckedThrowingContinuation { (cont: CheckedContinuation<[RAMCharacterModel], Error>) in
            service.getItems(ids: ids) { cont.resume(with: $0) }
        }
    }
    @available(iOS 15, macOS 12, *)
    public func getCharacters(page: UInt, filter: RAMCharacterFilter) async throws -> [RAMCharacterModel] {
        return try await withCheckedThrowingContinuation { (cont: CheckedContinuation<[RAMCharacterModel], Error>) in 
            service.getItems(page: page, filter: filter) { cont.resume(with: $0) }
        }
    }
}
