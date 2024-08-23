import Foundation

/// Locations request base path `location`
enum RAMLocationBasePath: RAMBasePath {
    static let basePath: String = "location"
}

/// RAMLocationService realisation
final class RAMLocationsServiceImp: RAMLocationsService {
    
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
    
    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMLocationModel] {
        return try await service.getAllItems(page: page)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getLocation(id: UInt) async throws -> RAMLocationModel? {
        return try await service.getItem(id: id)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getLocations(ids: [UInt]) async throws -> [RAMLocationModel] {
        return try await service.getItems(ids: ids)
    }
    
    @available(iOS 13.0, macOS 12.0, *)
    func getLocations(page: UInt, filter: RAMLocationFilter) async throws -> [RAMLocationModel] {
        return try await service.getItems(page: page, filter: filter)
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
}
