import XCTest
import Foundation
@testable import RickAndMortySwiftApi

final class RickAndMortyServiceTest: XCTestCase {
    private var network = RAMNetworkServiceMock()
    private var characterService: RAMCharactersService {
        RAMCharactesServiceRealisation(networkService: network)
    }
    private let expect = XCTestExpectation(description: "Character service")

    func testCharactersGetAll() {
        network.responseFileName = "GetAllCharactersResponse"
        characterService.getAll(page: 0) { [weak self] result in
            switch result {
            case .success(let characters):
                XCTAssertTrue(characters.count == 1, "Invalid characters count")
                XCTAssertTrue(characters.first?.id == 1 , "Invalid character id")
                XCTAssertTrue(characters.first?.name == "Rick Sanchez", "Invalid character name")
                XCTAssertTrue(characters.first?.origin?.name == "Earth", "Invalid origin name")
                XCTAssertTrue(characters.first?.location?.name == "Earth", "Invalid location name")
                XCTAssertTrue(characters.first?.episode?.count == 2, "Invalid episodes count")
            case .failure:
                XCTAssertFalse(true, "Error response")
            }
            self?.expect.fulfill()
        }
        wait(for: [expect], timeout: 60)
    }

    func testCharactersGetById() {
        network.responseFileName = "GetByIdCharacterResponse"
        characterService.getCharacter(id: 2) { [weak self] result in
            switch result {
            case .success(let character):
                XCTAssertTrue(character?.id == 2, "Invalid character id")
                XCTAssertTrue(character?.name == "Morty Smith", "Invalid charater name")
                XCTAssertTrue(character?.origin?.name == "Earth", "Invalid origin name")
                XCTAssertTrue(character?.episode?.count == 2, "Invalid epsodes count")
            case .failure:
                XCTAssertFalse(true, "Error response")
            }
            self?.expect.fulfill()
        }
        wait(for: [expect], timeout: 60)
    }

    func testCharactersGetByIds() {
        network.responseFileName = "GetByIdsCharactersResponse"
        characterService.getCharacters(ids:[1, 183]) { [weak self] result in
            switch result {
            case .success(let characters):
                XCTAssertTrue(characters.count == 2, "Invalid characters count")
                XCTAssertTrue(characters.first?.name == "Rick Sanchez", "Invalid character name")
                XCTAssertTrue(characters.last?.name == "Johnny Depp", "Invalid character name")
                XCTAssertTrue(characters.first?.origin?.name == "Earth (C-137)", "Invalid origin name")
                XCTAssertTrue(characters.last?.origin?.name == "Earth (C-500A)", "Invalid origin name")
                XCTAssertTrue(characters.first?.location?.name == "Earth (Replacement Dimension)", "Invalid location name")
                XCTAssertTrue(characters.last?.location?.name == "Earth (C-500A)", "Invalid location name")
                XCTAssertTrue(characters.first?.episode?.count == 2, "Invalid episode name")
                XCTAssertTrue(characters.last?.episode?.count == 1, "Invalid episode name")
            case .failure:
                XCTAssertFalse(true, "Error response")
            }
            self?.expect.fulfill()
        }
        wait(for: [expect], timeout: 60)
    }

    func testCharactersGetByFiliter() {
       network.responseFileName = "GetAllCharactersResponse"
       let filter = RAMCharacterFilter(name: "Rick")
       characterService.getCharacters(filter: filter) { [weak self] result in
           switch result {
           case .success(let characters):
                XCTAssertTrue(characters.count == 1, "Invalid characters count")
                XCTAssertTrue(characters.first?.id == 1 , "Invalid character id")
                XCTAssertTrue(characters.first?.name == "Rick Sanchez", "Invalid character name")
                XCTAssertTrue(characters.first?.origin?.name == "Earth", "Invalid origin name")
                XCTAssertTrue(characters.first?.location?.name == "Earth", "Invalid location name")
                XCTAssertTrue(characters.first?.episode?.count == 2, "Invalid episodes count")
           case .failure:
               XCTAssertFalse(true, "Error response")
           }
           self?.expect.fulfill()
       }
       wait(for: [expect], timeout: 60)
    }
}
