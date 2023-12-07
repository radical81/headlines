//
//  SourceViewModel.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import Foundation

/// View model for the source item display in the list of sources.
struct SourceViewModel {
  /// The data source
  var source: Source
  
  init(_ source: Source) {
    self.source = source
  }
  
  // MARK: - Computed Properties
  
  /// Name of the news source.
  var name: String {
    source.name
  }
}
