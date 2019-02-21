//
//  SearchListTests.swift
//  ABA MusicUITests
//
//  Created by Ricardo Casanova on 21/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import XCTest

class SearchListTests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetInitialTrackList() {
        let app = XCUIApplication()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"ABA_Music.SearchListView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let collectionView = element.children(matching: .other).element(boundBy: 1).children(matching: .collectionView).element
        XCTAssert(collectionView.cells.count >= 1, "Error getting the initial recipe list")
    }
    
    func testGetTracksBySearch() {
        let app = XCUIApplication()
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        app.keys["O"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["i"].tap()
        app.keys["s"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"Buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"ABA_Music.SearchListView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let collectionView = element.children(matching: .other).element(boundBy: 1).children(matching: .collectionView).element
        XCTAssert(collectionView.cells.count >= 1, "Error getting the initial recipe list")
    }

}
