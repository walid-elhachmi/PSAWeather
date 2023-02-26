//
//  PSAWeather_RemoteTests.swift
//  PSAWeather.RemoteTests
//
//  Created by Walid El Hachmi on 25/2/2023.
//

import XCTest
@testable import PSAWeather_Remote

final class PSAWeather_RemoteTests: XCTestCase {
    
    struct Weather: Codable {
        let name: String
        let timezone: Int
        let cod: Int
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchSuccess() {
        // Given
        let expectation = self.expectation(description: "request")
        let networkManager = NetworkManager()
        let url = Configuration.Endpoint.weather("paris").url!

        // When
        networkManager.request(url: url) { (result: Result<Weather, Error>) in
            // Then
            switch result {
            case .success(let weather):
                XCTAssertEqual(weather.name, "Paris")
                XCTAssertEqual(weather.timezone, 3600)
                XCTAssertEqual(weather.cod, 200)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success, but got error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchFailure() {
        // Given
        let expectation = self.expectation(description: "request")
        let networkManager = NetworkManager()
        let url = Configuration.Endpoint.weather("nothing").url!
        
        // When
        networkManager.request(url: url) { (result: Result<Weather, Error>) in
            // Then
            switch result {
            case .success(_):
                XCTFail("Expected error result, but got success")
            case .failure(let error):
                XCTAssertTrue(error is NetworkError)
                XCTAssertEqual((error as? NetworkError), NetworkError.invalidResponse)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
