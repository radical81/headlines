//
//  SourceViewModelTests.swift
//  ArticlesHeadlinesTests
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import XCTest
@testable import ArticlesHeadlines

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
