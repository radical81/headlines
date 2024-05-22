//
//  SourceViewModelTests.swift
//  ArticlesHeadlinesTests
//

import XCTest
@testable import ArticlesHeadlines

/// Test view model for the news sources screen.
final class SourceViewModelTests: XCTestCase {
  var source = Source(id: "123",
                      name: "ABC news",
                      description: "Public-funded news",
                      url: "www.abc.net.au",
                      selected: true)
  
  func testComputedProperties() throws {
    let viewModel = SourceViewModel(source)
    XCTAssertEqual(viewModel.id, source.id, "ID's don't match")
    XCTAssertEqual(viewModel.name, source.name, "Names don't match")
    XCTAssertEqual(viewModel.isSelected, source.selected, "Selected status doesn't match")
  }
}
