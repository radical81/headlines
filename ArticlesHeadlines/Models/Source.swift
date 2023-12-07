//
//  Source.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import Foundation

/// Tracks the source of the news for filtered content.
struct Source {
  /// Name of the news source.
  var name: String
  /// Description
  var description: String?
  /// URL link
  var url: String?
  /// Turns the news source on or off. If it's off, there will be no news retrieved from it.
  var selected: Bool
}

// MARK: - Equatable
/// For checking equal values to avoid duplication in arrays.
extension Source: Equatable {
  /// Checks if the news sources are the same
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.name == rhs.name
  }
}

// MARK: - Array operations
/// Check for existence of an element in the array.
extension Array where Element == Source {
  /// True if there's a matching element in the array.
  func findMatch(_ source: Source) -> Source? {
    let matches = self.filter {
      $0 == source
    }
    return matches.first
  }
}
