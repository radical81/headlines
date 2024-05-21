//
//  HeadlineViewModel.swift
//  ArticlesHeadlines
//

import Foundation
import UIKit

/// View model representing one item in the list of headlines.
struct HeadlineViewModel {
  var headline: Headline
  var errorMessage: String = ""
  
  init(_ headline: Headline) {
    self.headline = headline
  }
  
  // MARK: - Computed Properties
  var title: String {
    headline.title ?? ""
  }
  
  var description: String {
    headline.description ?? "(No description)"
  }
  
  var author: String {
    headline.author ?? ""
  }
  
  var articleUrl: String {
    headline.url ?? ""
  }
  
  var imageUrl: URL? {
    guard let url = URL(string: headline.urlToImage ?? "") else {
      return nil
    }
    return url
  }
}
