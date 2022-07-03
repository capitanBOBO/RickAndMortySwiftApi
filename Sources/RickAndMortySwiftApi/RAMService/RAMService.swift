import Foundation

enum RAMEndpoint<U: RAMFilter, O: RAMBasePath>: RAMEndpointInterface {
    case getAllItems(_ page: UInt)
    case getItemById(_ id: UInt)
    case getItemsByIds(_ ids: [UInt])
    case getItemsByFilter(_ filter: U)

    var path: String {
        switch self {
        case .getAllItems(let page):
            if page == 1 {
                return basePath
            } else {
                return basePath + "/?page=\(page)"
            }
        case .getItemById(let id):
            return basePath + "/\(id)"
        case .getItemsByIds(let ids):
            return ids.reduce(basePath) {
                if $0 == basePath {
                    return "\($0)/\($1)"
                } else {
                    return "\($0),\($1)"
                }
            }
        case .getItemsByFilter(let filter):
            return basePath + "/" + filter.query
        }
    }

    var method: String {
        return "GET"
    }

    private var basePath: String {
        O.basePath
    }
}

private struct RAMServiceResponse<T: Codable>: Codable {
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
    let info: Info?
    let results: [T]?
}

struct RAMService<T: Codable, U: RAMFilter, O: RAMBasePath> {
    private let network: RAMNetworkServiceInterface

    init(_ networkService: RAMNetworkServiceInterface) {
        self.network = networkService
    }

    @discardableResult public func getAllItems(page: UInt, completion: @escaping (Result<[T], Error>) -> ()) -> URLSessionTask? {
        let endpoint = RAMEndpoint<U, O>.getAllItems(page)

        return network.execute(endpoint) { result in
            var completionResult: Result<[T], Error>
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(RAMServiceResponse<T>.self, from: data)
                    completionResult = .success(response.results ?? [])
                } catch(let error) {
                    completionResult = .failure(error)
                }
            case .failure(let error):
                completionResult = .failure(error)
            }
            DispatchQueue.main.async {
                completion(completionResult)
            }
        }
    }

    @discardableResult public func getItem(id: UInt, completion: @escaping (Result<T?, Error>) -> ()) -> URLSessionTask? {
        let endpoint = RAMEndpoint<U, O>.getItemById(id)

        return network.execute(endpoint) { result in
            var completionResult: Result<T?, Error>
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completionResult = .success(response)
                } catch(let error) {
                    completionResult = .failure(error)
                }
            case .failure(let error):
                completionResult = .failure(error)
            }
            DispatchQueue.main.async {
                completion(completionResult)
            }
        }

    }

    @discardableResult public func getItems(ids: [UInt], completion: @escaping (Result<[T], Error>) -> ()) -> URLSessionTask? {
        let endpoint = RAMEndpoint<U, O>.getItemsByIds(ids)

        return network.execute(endpoint) { result in
            var completionResult: Result<[T], Error>
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([T].self, from: data)
                    completionResult = .success(response)
                } catch (let error) {
                    completionResult = .failure(error)
                }
            case .failure(let error):
                completionResult = .failure(error)
            }
            DispatchQueue.main.async {
                completion(completionResult)
            }
        }

    }

    @discardableResult public func getItems(filter: U, completion: @escaping (Result<[T], Error>) -> ()) -> URLSessionTask? {
       let endpoint = RAMEndpoint<U, O>.getItemsByFilter(filter)

       return network.execute(endpoint) { result in
            var completionResult: Result<[T], Error>
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(RAMServiceResponse<T>.self, from: data)
                    completionResult = .success(response.results ?? [])
                } catch(let error) {
                    completionResult = .failure(error)
                }
            case .failure(let error):
                completionResult = .failure(error)
            }
            DispatchQueue.main.async {
                completion(completionResult)
            }
        }

    }
}

