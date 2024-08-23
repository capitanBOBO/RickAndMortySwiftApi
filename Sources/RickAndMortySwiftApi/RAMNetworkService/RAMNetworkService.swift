import Foundation

enum RAMNetworkError: Error {
    case invalidUrl
    case invalidData
    case invalidStatusCode(_ code: Int)
    case invalidResponse
}

protocol RAMNetworkServiceInterface {
    @available(iOS 13.0, macOS 12.0, *)
    func execute(_ endpoint: RAMEndpointInterface) async throws -> Data
    @discardableResult func execute(_ endpoint: RAMEndpointInterface, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask?
}

struct RAMNetworkService: RAMNetworkServiceInterface {
    private let basePath = "https://rickandmortyapi.com/api/"
    private var session: URLSession {
        URLSession(configuration: .default)
    }

    private func prepareRequest(for endpoint: RAMEndpointInterface) -> URLRequest? {
        guard let url = URL(string: basePath + endpoint.path) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        return request
    }

    @available(iOS 13.0, macOS 12.0, *)
    func execute(_ endpoint: RAMEndpointInterface) async throws -> Data {
        guard let request = prepareRequest(for: endpoint) else {
            throw RAMNetworkError.invalidUrl
        }
        do {
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw RAMNetworkError.invalidResponse
            }
            guard response.statusCode >= 200 || response.statusCode < 300 else {
                throw RAMNetworkError.invalidStatusCode(response.statusCode)
            }
            return data
        } catch {
            throw error
        }
    }

    @discardableResult func execute(_ endpoint: RAMEndpointInterface, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask? {
        guard let request = prepareRequest(for: endpoint) else {
            completion(.failure(RAMNetworkError.invalidUrl))
            return nil
        }

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
