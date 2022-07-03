import Foundation

protocol RAMFilter {
    var query: String { get }
}

protocol RAMEndpointInterface {
    var path: String { get }
    var method: String { get }
}

protocol RAMBasePath {
    static var basePath: String { get }
}

