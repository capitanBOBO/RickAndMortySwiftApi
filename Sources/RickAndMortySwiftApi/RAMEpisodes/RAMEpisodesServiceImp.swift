import Foundation

/// Episodes request base path `episode`
enum RAMEpisodeBasePath: RAMBasePath {
    static let basePath: String = "episode"
}

/// RAMEpisodeService realisation
final class RAMEpisodesServiceImp: RAMEpisodesService {
    private typealias RAMServiceAlias = RAMService<RAMEpisodeModel, RAMEpisodeFilter, RAMEpisodeBasePath>

    private let service: RAMServiceAlias
    /**
    Initialization of service
    - Parameters:
        - networkService: network service for requests `RAMNetworkServiceInterface` 

    - Returns: Episodes service
    */
    init(networkService: RAMNetworkServiceInterface) {
        service = RAMServiceAlias(networkService)
    }

    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMEpisodeModel] {
        return try await service.getAllItems(page: page)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisode(id: UInt) async throws -> RAMEpisodeModel? {
        return try await service.getItem(id: id)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisodes(ids: [UInt]) async throws -> [RAMEpisodeModel] {
        return try await service.getItems(ids: ids)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisodes(page: UInt, filter: RAMEpisodeFilter) async throws -> [RAMEpisodeModel] {
        return try await service.getItems(page: page, filter: filter)
    }

    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask? {
        return service.getAllItems(page: page, completion: completion)
    }
    @discardableResult func getEpisode(id: UInt, completion: @escaping (Result<RAMEpisodeModel?, Error>)->()) -> URLSessionTask? {
        return service.getItem(id: id, completion: completion)
    }
    @discardableResult func getEpisodes(ids: [UInt], completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(ids: ids, completion: completion)
    }
    @discardableResult func getEpisodes(page: UInt, filter: RAMEpisodeFilter, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(page: page, filter: filter, completion: completion)
    }
}
