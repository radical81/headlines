import XCTest

/// UI Testing for headlines list.
final class HeadlinesUITests: XCTestCase {
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    app.launchArguments.append("UITest")
    continueAfterFailure = false
  }
  
  /// Check if all tabs are present.
  func testTabs() throws {
    let tabBar = XCUIApplication().tabBars["Tab Bar"]
    let headlinesTab = tabBar.buttons["Headlines"]
    let sourcesTab = tabBar.buttons["Sources"]
    let savedTab = tabBar.buttons["Saved"]
    XCTAssertTrue(headlinesTab.exists, "Headlines tab is missing.")
    XCTAssertTrue(sourcesTab.exists, "Sources tab is missing.")
    XCTAssertTrue(savedTab.exists, "Savbed tab is missing.")
  }
  
  /// Check navigation header.
  func testHeadlinesListTitle() throws {
    app.launch()
    let navTitle = app.navigationBars["Headlines"].staticTexts["Headlines"]
    XCTAssertTrue(navTitle.exists, "Navigation title is missing.")
  }
  
  /// Check first headline item.
  func testShowFirstHeadline() throws {
    app.launch()
    let firstTitle = app.collectionViews.staticTexts["Accenture set to buy Partners in Performance"]
    XCTAssertTrue(firstTitle.exists)
  }
}
