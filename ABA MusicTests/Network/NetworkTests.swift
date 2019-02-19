//
//  NetworkTests.swift
//  ABA MusicTests
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import XCTest
@testable import ABA_Music

typealias artistsCompletionBlock = (Result<ArtistsResponse?>) -> Void

class NetworkTests: XCTestCase {

    private let requestManager = RequestManager()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testArtistsResultsWith(search: String? = nil, simulatedJSONFile: String? = nil, completion: @escaping artistsCompletionBlock) {
        var artistsRequest = ArtistsRequest(search: search)
        
        artistsRequest.completion = completion
        artistsRequest.simulatedResponseJSONFile = simulatedJSONFile
        artistsRequest.verbose = true
        requestManager.send(request: artistsRequest)
    }
    
    func testArtistsResults() {
        let artistsResultsExpectation: XCTestExpectation = self.expectation(description: "artistsResultsExpectation")
        
        testArtistsResultsWith(search: "beatles") { (response) in
            switch response {
            case .success(let response):
                guard let response = response else {
                    XCTFail("Impossible to get the response")
                    return
                }
                XCTAssert(response.results.count != 0, "data array can't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            artistsResultsExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 25.0, handler: nil)
    }
    
    func testSimulatedArtistsResults() {
        let artistsResultsExpectation: XCTestExpectation = self.expectation(description: "artistsResultsExpectation")
        
        testArtistsResultsWith(search: "beatles", simulatedJSONFile: "Artists") { (response) in
            switch response {
            case .success(let response):
                guard let response = response else {
                    XCTFail("Impossible to get the response")
                    return
                }
                XCTAssert(response.results.count != 0, "data array can't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            artistsResultsExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 25.0, handler: nil)
    }

}
