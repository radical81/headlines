//
//  HeadlinesViewModel.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 19/2/2024.
//

import Foundation

/// View model representing the collection of headlines.
struct HeadlinesViewModel {
  var headlines: [Headline]
  
  init(_ headines: [Headline]) {
    self.headlines = headines
  }
  
  /// The collection of headlines represented by individual view models for each headline.
  var headlineViewModels: [HeadlineViewModel] {
    headlines.map { HeadlineViewModel($0) }
  }
}
