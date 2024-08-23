import Foundation
@testable import RickAndMortySwiftApi

enum RAMMockError: Error {
    case error
}

struct RAMNetworkServiceMock: RAMNetworkServiceInterface {
    var responseFileName: String = ""
    
    func execute(_ endpoint: RickAndMortySwiftApi.RAMEndpointInterface) async throws -> Data {
        guard let pathUrl = Bundle.module.url(forResource: responseFileName, withExtension: "json") else {
            throw NSError()
        }
        do {
            let data = try Data(contentsOf: pathUrl)
            return data
        } catch {
            throw error
        }
    }

    @discardableResult func execute(_ endpoint: RAMEndpointInterface, completion: @escaping (Result<Data, Error>)->Void) -> URLSessionTask? {
       guard let pathUrl = Bundle.module.url(forResource: responseFileName, withExtension: "json"),
       let data = try? Data(contentsOf: pathUrl) else {
           completion(.failure(RAMMockError.error))
           return nil
       }
       completion(.success(data))
       return nil
    }
}
