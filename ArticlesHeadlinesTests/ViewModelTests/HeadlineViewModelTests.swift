//
//  HeadlineViewModelTests.swift
//  ArticlesHeadlinesTests
//

import XCTest
@testable import ArticlesHeadlines

final class HeadlineViewModelTests: XCTestCase {
  var headline = Headline(title: "Extra extra",
                          description: "Urgent news read all about it.",
                          author: "Rex",
                          url: "www.google.com",
                          urlToImage: "www.google.com")
  
  func testComputedProperties() throws {
    let viewModel = HeadlineViewModel(headline)
    XCTAssertEqual(viewModel.title, headline.title, "Titles don't match")
    XCTAssertEqual(viewModel.description, headline.description, "Descriptions don't match")
    XCTAssertEqual(viewModel.author, headline.author, "Authors don't match")
    XCTAssertEqual(viewModel.articleUrl, headline.url, "Article URLs don't match")
    XCTAssertNotNil(viewModel.imageUrl, "Invalid image URL")
  }
}
