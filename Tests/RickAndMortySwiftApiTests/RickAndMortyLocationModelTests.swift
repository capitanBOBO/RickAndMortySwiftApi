import XCTest
import Foundation
@testable import RickAndMortySwiftApi

final class RickAndMortyLocationModelTests: XCTestCase {
    private var network = RAMNetworkServiceMock()
    private var locationService: RAMLocationsService {
        return RAMLocationsServiceImp(networkService: network)
    }
    
    func testLocationModelParsing() {
        let expect = XCTestExpectation(description: "Location response")
        network.responseFileName = "GetByIdLocationResponse"
        locationService.getLocation(id: 3) { result in
            if case .success(let location) = result {
                XCTAssertNotNil(location, "Empty location")
                XCTAssertNotNil(location?.id, "Empty location id")
                XCTAssertNotNil(location?.name, "Empty location name")
                XCTAssertNotNil(location?.dimension, "Empty dimension")
                XCTAssertNotNil(location?.type, "Empty location type")
                XCTAssertNotNil(location?.residents, "Empty residents")
                XCTAssertNotNil(location?.url, "Empty url")
                XCTAssertNotNil(location?.created, "Empty creation date")
            } else {
                XCTAssertFalse(true, "Error response")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 60)
    }
    
    func testLocationModelParcingAsync() {
        let expect = XCTestExpectation(description: "Location response")
        network.responseFileName = "GetByIdLocationResponse"
        Task {
            do {
                let location = try await locationService.getLocation(id: 3)
                XCTAssertNotNil(location, "Empty location")
                XCTAssertNotNil(location?.id, "Empty location id")
                XCTAssertNotNil(location?.name, "Empty location name")
                XCTAssertNotNil(location?.dimension, "Empty dimension")
                XCTAssertNotNil(location?.type, "Empty location type")
                XCTAssertNotNil(location?.residents, "Empty residents")
                XCTAssertNotNil(location?.url, "Empty url")
                XCTAssertNotNil(location?.created, "Empty creation date")
                expect.fulfill()
            } catch {
                XCTFail("Error response")
            }
        }
        wait(for: [expect], timeout: 60)
    }
}
