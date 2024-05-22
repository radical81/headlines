import XCTest

/// UI Testing for headlines list.
final class HeadlinesUITests: XCTestCase {
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    app.launchArguments.append("UITest")
    continueAfterFailure = false
  }
  
  func testHeadlinesDisplay() throws {    
    app.launch()
    let heading = app.navigationBars["Headlines"].staticTexts["Headlines"]
    XCTAssertTrue(heading.exists)
  }
  
  func testShowFirstHeadline() throws {
    app.launch()
    let firstTitle = app.collectionViews.staticTexts["Accenture set to buy Partners in Performance"]
    XCTAssertTrue(firstTitle.exists)
  }
}
