//
//  HeadlineViewModelTests.swift
//  ArticlesHeadlinesTests
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import XCTest
@testable import ArticlesHeadlines

final class HeadlineViewModelTests: XCTestCase {
  var headline = Headline(title: "Extra extra",
                          description: "Urgent news read all about it.",
                          author: "Rex",
                          url: "www.google.com",
                          urlToImage: "www.google.com/pic")

    func testComputedProperties() throws {
      var viewModel = HeadlineViewModel(headline)
      XCTAssertEqual(viewModel.title, headline.title, "Titles don't match")
    }
}
