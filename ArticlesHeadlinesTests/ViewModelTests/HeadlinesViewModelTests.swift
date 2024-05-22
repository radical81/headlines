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
    var expectedSecondHeadline = Headline()
    expectedSecondHeadline.title = "ASX sharemarket: UBS strategist Richard Schellbach says Wall Street’s relentless grind higher will flow through to a mini melt-up, and picks 12 local stocks to watch"
    await viewModel.fetchHeadlines()
    XCTAssertEqual(viewModel.dataForLoading, .loaded([]))
    XCTAssertEqual(viewModel.headlines.first, expectedFirstHeadline, "The headlines are different.")
    XCTAssertEqual(viewModel.headlines[1], expectedSecondHeadline, "The headlines are different.")
  }
}
