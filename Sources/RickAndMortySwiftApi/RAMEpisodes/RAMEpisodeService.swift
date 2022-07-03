import Foundation

enum RAMEpisodeBasePath: RAMBasePath {
    static let basePath: String = "episode"
}

public struct RAMEpisodeFilter: RAMFilter {
    public let name: String?
    public let episodeCode: String?

    var query: String {
        var result = "?"
        if let name = name {
            result += "name=\(name)"
        }
        if let episode = episodeCode {
            if result != "?" { result += "&" }
            result += "episode=\(episode)"
        }
        return result
    }

    public init(name: String? = nil, episodeCode: String? = nil) {
        self.name = name
        self.episodeCode = episodeCode
    }
}

public protocol RAMEpisodeService {
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getEpisode(id: UInt, completion: @escaping (Result<RAMEpisodeModel?, Error>)->()) -> URLSessionTask?
    @discardableResult func getEpisodes(ids: [UInt], completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getEpisodes(filter: RAMEpisodeFilter, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?
}

struct RAMEpisodeServiceRealisation: RAMEpisodeService {
    private typealias RAMServiceAlias = RAMService<RAMEpisodeModel, RAMEpisodeFilter, RAMEpisodeBasePath>

    private let service: RAMServiceAlias

    init(network: RAMNetworkServiceInterface) {
        service = RAMServiceAlias(network)
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
    @discardableResult func getEpisodes(filter: RAMEpisodeFilter, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(filter: filter, completion: completion)
    }
}
