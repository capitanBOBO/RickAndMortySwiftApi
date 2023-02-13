import Foundation

/// Locations request base path `location`
enum RAMLocationBasePath: RAMBasePath {
    static let basePath: String = "location"
}

/// RAMLocationService realisation
struct RAMLocationsServiceImp: RAMLocationsService {
    private typealias RAMServiceAlias = RAMService<RAMLocationModel, RAMLocationFilter, RAMLocationBasePath>

    private let service: RAMServiceAlias

    /**
    Initialization of service
    - Parameters:
        - networkService: network service for requests `RAMNetworkServiceInterface` 

    - Returns: Locations service
    */
    init(networkService: RAMNetworkServiceInterface) {
        service = RAMServiceAlias(networkService)
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
    @discardableResult public func getLocations(page: UInt, filter: RAMLocationFilter, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask? {
        return service.getItems(page: page, filter: filter, completion: completion)
    }

    @available(iOS 15, macOS 12, *)
    public func getAll(page: UInt) async throws -> [RAMLocationModel] {
        return try await withCheckedThrowingContinuation { (cont: CheckedContinuation<[RAMLocationModel], Error>) in
            service.getAllItems(page: page) { cont.resume(with: $0) }
        }
    }

    @available(iOS 15, macOS 12, *)
    public func getLocation(id: UInt) async throws -> RAMLocationModel? {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<RAMLocationModel?, Error>) in
            service.getItem(id: id) { result in
                continuation.resume(with: result)
            }
        }
    }

    @available(iOS 15, macOS 12, *)
    public func getLocations(ids: [UInt]) async throws -> [RAMLocationModel] {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[RAMLocationModel], Error>) in
            service.getItems(ids: ids) { result in
                continuation.resume(with: result)
            }
        } 
    }

    @available(iOS 15, macOS 12, *)
    public func getLocations(page: UInt, filter: RAMLocationFilter) async throws -> [RAMLocationModel] {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[RAMLocationModel], Error>) in
            service.getItems(page: page, filter: filter) { result in
                continuation.resume(with: result)
            }
        }
    }
}
