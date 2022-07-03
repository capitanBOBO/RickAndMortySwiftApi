import Foundation

enum RAMNetworkError: Error {
    case invalidUrl
    case invalidData
    case invalidStatusCode(_ code: Int)
    case invalidResponse
}

protocol RAMNetworkServiceInterface {
    @discardableResult func execute(_ endpoint: RAMEndpointInterface, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask?
}

struct RAMNetworkService: RAMNetworkServiceInterface {
    private let basePath = "https://rickandmortyapi.com/api/"

    @discardableResult func execute(_ endpoint: RAMEndpointInterface, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask? {
        guard let url = URL(string: basePath + endpoint.path) else {
            completion(.failure(RAMNetworkError.invalidUrl))
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(RAMNetworkError.invalidResponse))
                return
            }
            guard response.statusCode >= 200 || response.statusCode < 300 else {
                completion(.failure(RAMNetworkError.invalidStatusCode(response.statusCode)))
                return 
            }
            guard let data = data else {
                completion(.failure(RAMNetworkError.invalidData))
                return
            }
            completion(.success(data))
        }
        task.resume()
        return task
    }

}
