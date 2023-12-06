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
  /// Turns the news source on or off. If it's off, there will be no news retrieved from it.
  var selected: Bool
  
  init(_ source: Source, selected: Bool) {
    self.source = source
    self.selected = selected
  }
  
  
  // MARK: - Computed Properties
  
  /// Name of the news source.
  var name: String {
    source.name
  }
  

}
