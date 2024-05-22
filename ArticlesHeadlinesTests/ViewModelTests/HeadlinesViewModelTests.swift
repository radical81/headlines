//
//  HeadlinesViewModelTests.swift
//  ArticlesHeadlinesTests
//

import XCTest
@testable import ArticlesHeadlines

final class HeadlinesViewModelTests: XCTestCase {
  func testComputedProperties() async throws {
    let viewModel = HeadlinesViewModel(source: MockNews())
    // Initial data
    XCTAssertEqual(viewModel.dataForLoading, .notLoaded)
    XCTAssertTrue(viewModel.headlines.isEmpty)
    // Fetch data
    var expectedFirstHeadline = Headline()
    expectedFirstHeadline.title = "Accenture set to buy Partners in Performance"
    await viewModel.fetchHeadlines()
    XCTAssertEqual(viewModel.dataForLoading, .loaded([]))
    XCTAssertEqual(viewModel.headlines.first, expectedFirstHeadline, "The headlines are different.")
  }
}
