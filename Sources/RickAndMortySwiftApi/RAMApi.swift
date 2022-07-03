import Foundation
public struct RAMApi {
    private let networkService = RAMNetworkService()
    public var characters: RAMCharactersService {
        RAMCharactesServiceRealisation(networkService: networkService)
    }

    public var locations: RAMLocationService {
        RAMLocationServiceRealisation(network: networkService)
    }

    public var episodes: RAMEpisodeService {
        RAMEpisodeServiceRealisation(network: networkService)
    }
    public init() {}
}
