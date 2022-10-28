import Foundation

/// Rick and Morty API entrypoint
public struct RAMApi {
    private let networkService = RAMNetworkService()

    /// Characters service access
    public var characters: RAMCharactersService {
        RAMCharactesServiceImp(networkService: networkService)
    }

    /// Locations services access
    public var locations: RAMLocationsService {
        RAMLocationsServiceImp(networkService: networkService)
    }

    /// Episodes services access
    public var episodes: RAMEpisodesService {
        RAMEpisodesServiceImp(networkService: networkService)
    }

    /// Default init
    public init() {}
}
