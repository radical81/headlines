//
//  HeadlineItemViewModelTests.swift
//  ArticlesHeadlinesTests
//

import XCTest
@testable import ArticlesHeadlines

/// Test the view model for a single headline item in the list.
final class HeadlineItemViewModelTests: XCTestCase {
  var headline = Headline(title: "Extra extra",
                          description: "Urgent news read all about it.",
                          author: "Rex",
                          url: "www.google.com",
                          urlToImage: "www.google.com")
  
  func testComputedProperties() throws {
    let viewModel = HeadlineItemViewModel(headline)
    XCTAssertEqual(viewModel.title, headline.title, "Titles don't match")
    XCTAssertEqual(viewModel.description, headline.description, "Descriptions don't match")
    XCTAssertEqual(viewModel.author, headline.author, "Authors don't match")
    XCTAssertEqual(viewModel.articleUrl, headline.url, "Article URLs don't match")
    XCTAssertNotNil(viewModel.imageUrl, "Invalid image URL")
  }
}
