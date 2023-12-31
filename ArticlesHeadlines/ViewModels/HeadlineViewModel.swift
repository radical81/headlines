//
//  HeadlineViewModel.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
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
    headline.description ?? ""
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
