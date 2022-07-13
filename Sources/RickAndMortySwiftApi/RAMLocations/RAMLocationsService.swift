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
    @discardableResult func getLocations(filter: RAMLocationFilter, completion: @escaping (Result<[RAMLocationModel], Error>)->()) -> URLSessionTask?
}
