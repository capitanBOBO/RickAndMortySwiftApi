import Foundation

/// Rick and Morty API entrypoint
public final class RAMApi {
    private let networkService = RAMNetworkService()

    public init() {}

    public var characters: RAMCharactersService {
        RAMCharactesServiceImp(networkService: networkService)
    }

    public var locations: RAMLocationsService {
        RAMLocationsServiceImp(networkService: networkService)
    }

    public var episodes: RAMEpisodesService {
        RAMEpisodesServiceImp(networkService: networkService)
    }
}
