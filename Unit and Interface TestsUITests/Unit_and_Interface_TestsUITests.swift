//
//  Unit_and_Interface_TestsUITests.swift
//  Unit and Interface TestsUITests
//
//  Created by Corwin Rainier on 7/4/22.
//

import XCTest

class Unit_and_Interface_TestsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialStateIsCorrect() {
        let app = XCUIApplication()
        let table = app.tables
        app.launch()
        XCTAssertEqual(table.cells.count, 7, "There should be 7 rows initially")
    }
    
    func testUserFilteringString() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Testing Project"].buttons["Search"].tap()
        app.textFields["Search word or number"].tap()
        app.textFields["Search word or number"].typeText("test")
        app.buttons["Filter"].tap()
        XCTAssertEqual(app.tables.cells.count, 56, "There should be 56 words matching 'test'")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
