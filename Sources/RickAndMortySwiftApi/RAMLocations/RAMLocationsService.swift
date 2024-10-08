import Foundation

/**
Locations request filter
```
// Parameters:
//  name      : String? - Location name.
//  type      : String? - Location type.
//  dimension : String? - Dimension in which location is located
```
*/
public struct RAMLocationFilter: RAMFilter {
    /// Location name
    public let name: String?
    /// Location type
    public let type: String?
    /// Dimension in which location is located
    public let dimension: String?

    /**
    Query for request
    ```
    RAMLocationFilter(name: "location")

    // "?name=location"
    ```
    */
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

    /**
    Init new location filter
    - Parameters:
        - name: Location name
        - type: ... type
        - dimension: ... dimension

    - Returns: A new location filter for request
    */
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

/// Locations service. Allows to request all locations or locations by id/filter
public protocol RAMLocationsService {

    
    /// Requests all Locations for specific page (async/await)
    /// - Parameter page: Locations list page, start with 1
    /// - Returns: array of `RAMLocationModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMLocationModel]
    
    /// Request Location by id (async/await)
    /// - Parameter id: Location id
    /// - Returns: `RAMLocationModel`(optional)
    @available(iOS 13.0, macOS 12.0, *)
    func getLocation(id: UInt) async throws -> RAMLocationModel?
    
    /// Requests Locations by ids
    /// - Parameter ids: array of charater ids
    /// - Returns: array of `RAMLocationModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getLocations(ids: [UInt]) async throws -> [RAMLocationModel]
    
    /// Requests Locations by filter
    /// - Parameters:
    ///   - page: Locations list page, start with 1
    ///   - filter: Locations filter `RAMLocationFilter`
    /// - Returns: array of `RAMLocationModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getLocations(page: UInt, filter: RAMLocationFilter) async throws -> [RAMLocationModel]

    /**
    Requests all locations for specific page
    - Parameters:
        - page: locations list page, start with 1
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?

    /**
    Requests location by id
    - Parameters:
        - id: locations id
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getLocation(id: UInt, completion: @escaping (Result<RAMLocationModel?, Error>)->()) -> URLSessionTask?

    /**
    Requests locations by ids
    - Parameters:
        - ids: array of locations ids
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getLocations(ids: [UInt], completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?

    /**
    Requests locations by filter
    - Parameters:
        - filter: locations filter `RAMLocationFilter`
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getLocations(page: UInt, filter: RAMLocationFilter, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?
}
