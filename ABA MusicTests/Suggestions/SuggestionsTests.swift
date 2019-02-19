//
//  SuggestionsTests.swift
//  ABA MusicTests
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import XCTest
@testable import ABA_Music

class SuggestionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDeleteAllSuggestions() {
        SearchSuggestionsManager.shared.saveSuggestion("The beatles")
        SearchSuggestionsManager.shared.saveSuggestion("Oasis")
        SearchSuggestionsManager.shared.saveSuggestion("Rolling Stones")
        SearchSuggestionsManager.shared.saveSuggestion("Blur")
        SearchSuggestionsManager.shared.saveSuggestion("The verve")
        SearchSuggestionsManager.shared.deleteAllSuggestions()
        
        let suggestions = SearchSuggestionsManager.shared.getSuggestions()
        XCTAssert(suggestions.count == 0)
    }
    
    func testSaveSuggestions() {
        SearchSuggestionsManager.shared.deleteAllSuggestions()
        
        SearchSuggestionsManager.shared.saveSuggestion("The beatles")
        SearchSuggestionsManager.shared.saveSuggestion("Oasis")
        SearchSuggestionsManager.shared.saveSuggestion("Rolling Stones")
        SearchSuggestionsManager.shared.saveSuggestion("Blur")
        SearchSuggestionsManager.shared.saveSuggestion("The verve")
        
        let suggestions = SearchSuggestionsManager.shared.getSuggestions()
        XCTAssert(suggestions.count == 5)
    }

}
