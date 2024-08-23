import Foundation

/**
Episodes request filter
```
// Parameters:
//  name        : String? - Episode name.
//  episodeCode : String? - Episode code, ex. "S01E01".
```
*/
public struct RAMEpisodeFilter: RAMFilter {
    /// Episode name
    public let name: String?
    /// Episode code, ex. "S01E01"
    public let episodeCode: String?

    /**
    Query for request
    ```
    RAMEpisodeFilter(name: "episode name")

    // "?name=episode\ name"
    ```
    */
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

    /**
    Init new episode filter
    - Parameters:
        - name: Episode name
        - episodeCode: ... code

    - Returns: A new episodes filter for request
    */
    public init(name: String? = nil, episodeCode: String? = nil) {
        self.name = name
        self.episodeCode = episodeCode
    }
}

/// Episodes service. Allows to request all episodes or episodes by id/filter
public protocol RAMEpisodesService {

    
    /// Requests all Episodes for specific page (async/await)
    /// - Parameter page: Episodes list page, start with 1
    /// - Returns: array of `RAMEpisodeModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getAll(page: UInt) async throws -> [RAMEpisodeModel]
    
    /// Request Episode by id (async/await)
    /// - Parameter id: Episode id
    /// - Returns: `RAMEpisodeModel`(optional)
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisode(id: UInt) async throws -> RAMEpisodeModel?
    
    /// Requests Episodes by ids
    /// - Parameter ids: array of charater ids
    /// - Returns: array of `RAMEpisodemodel`
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisodes(ids: [UInt]) async throws -> [RAMEpisodeModel]
    
    /// Requests Episodes by filter
    /// - Parameters:
    ///   - page: Episodes list page, start with 1
    ///   - filter: Episodes filter `RAMEpisodeFilter`
    /// - Returns: array of `RAMEpisodeModel`
    @available(iOS 13.0, macOS 12.0, *)
    func getEpisodes(page: UInt, filter: RAMEpisodeFilter) async throws -> [RAMEpisodeModel]

    /**
    Requests all episodes for specific page
    - Parameters:
        - page: episodes list page, start with 1
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getAll(page: UInt, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?

    /**
    Requests episode by id
    - Parameters:
        - id: episodes id
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getEpisode(id: UInt, completion: @escaping (Result<RAMEpisodeModel?, Error>)->()) -> URLSessionTask?

    /**
    Requests episodes by ids
    - Parameters:
        - ids: array of episodes ids
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getEpisodes(ids: [UInt], completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?

    /**
    Requests episodes by filter
    - Parameters:
        - filter: episodes filter `RAMEpisodeFilter`
        - completion: closure, result with response

    - Returns: discardable URLSessionTask (optional)
    */
    @discardableResult func getEpisodes(page: UInt, filter: RAMEpisodeFilter, completion: @escaping (Result<[RAMEpisodeModel], Error>)->()) -> URLSessionTask?
}

