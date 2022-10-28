import Foundation

/// Episodes request base path `episode`
enum RAMEpisodeBasePath: RAMBasePath {
    static let basePath: String = "episode"
}

/// RAMEpisodeService realisation
struct RAMEpisodesServiceImp: RAMEpisodesService {
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
