//
//  Headline.swift
//  ArticlesHeadlines
//

import Foundation

/// Represents the top headlines data returned from the News API.
struct Headline: Codable {
  var title: String?
  var description: String?
  var author: String?
  var url: String?
  var urlToImage: String?
}

// MARK: - Equatable
/// For checking equal values to avoid duplication in arrays.
extension Headline: Equatable {
  /// Checks if the news sources are the same
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.title == rhs.title
  }
}

// MARK: - Array operations
/// Check for existence of an element in the array.
extension Array where Element == Headline {
  /// True if there's a matching element in the array.
  func findMatch(_ headline: Headline) -> Headline? {
    let matches = self.filter {
      $0 == headline
    }
    return matches.first
  }
}
