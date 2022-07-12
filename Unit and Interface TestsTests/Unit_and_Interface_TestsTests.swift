//
//  Unit_and_Interface_TestsTests.swift
//  Unit and Interface TestsTests
//
//  Created by Corwin Rainier on 7/4/22.
//

import XCTest
@testable import Unit_and_Interface_Tests

class Unit_and_Interface_TestsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18440, "allWords must be 18440")
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "little"), 207, "Little does not appear 271 times")
        XCTAssertEqual(playData.wordCounts.count(for: "bald"), 8, "Bald does not appear 17 times")
        XCTAssertEqual(playData.wordCounts.count(for: "Frenchman"), 17, "Frenchman does not appear 17 times")
    }
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    func testUserFilterWorks() {
        let playData = PlayData()
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495, "Number of words that number 100 or more are not equal to 495")
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55, "Number of words that number 1000 or more are not equal to 55")
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1,  "Number of words that number 10000 or more are not equal to 1")
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56, "Test does not appear 56 times")
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7, "Swift does not appear 7 times")
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0, "Objective-C appears, but should not")
    }
}
