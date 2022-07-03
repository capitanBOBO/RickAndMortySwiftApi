import Foundation

enum RAMLocationBasePath: RAMBasePath {
    static let basePath: String = "location"
}

public struct RAMLocationFilter: RAMFilter {
    public let name: String?
    public let type: String?
    public let dimension: String?

    var query: String {
        var result = "?"
        if let name = name {
            result += "name=\(name)"
        }
        if let type = type {
            if result != "?" { result += "&" }
            result += "type=\(type)"
        }
        if let dimension = dimension {
            if result != "?" { result += "&" }
            result += "dimension=\(dimension)"
        }
        return result
    }

    public init(
        name: String? = nil,
        type: String? = nil,
        dimension: String? = nil
    ) {
        self.name = name
        self.type = type
        self.dimension = dimension
    }
}

public protocol RAMLocationService {
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getLocation(id: UInt, completion: @escaping (Result<RAMLocationModel?, Error>)->()) -> URLSessionTask?
    @discardableResult func getLocations(ids: [UInt], completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?
    @discardableResult func getLocations(filter: RAMLocationFilter, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?
}

struct RAMLocationServiceRealisation: RAMLocationService {
    private typealias RAMServiceAlias = RAMService<RAMLocationModel, RAMLocationFilter, RAMLocationBasePath>

    private let service: RAMServiceAlias

    init(network: RAMNetworkServiceInterface) {
        service = RAMServiceAlias(network)
    }

    @discardableResult public func getAll(page: UInt, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask? {
        return service.getAllItems(page: page, completion: completion)
    }
    @discardableResult public func getLocation(id: UInt, completion: @escaping (Result<RAMLocationModel?, Error>)->()) -> URLSessionTask? {
        return service.getItem(id: id, completion: completion)
    }
    @discardableResult public func getLocations(ids: [UInt], completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(ids: ids, completion: completion)
    }
    @discardableResult public func getLocations(filter: RAMLocationFilter, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(filter: filter, completion: completion)
    }
}
