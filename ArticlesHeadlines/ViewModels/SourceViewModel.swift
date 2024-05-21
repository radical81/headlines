//
//  SourceViewModel.swift
//  ArticlesHeadlines
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
  
  /// ID of the news source.
  var id: String {
    source.id
  }
  
  /// Name of the news source.
  var name: String {
    source.name ?? ""
  }
  /// True if the source is selected.
  var isSelected: Bool {
    source.selected
  }
}
