//
//  Source.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import Foundation

/// Tracks the source of the news for filtered content.
struct Source: Codable {
  /// ID of the news source.
  var id: String
  /// Name of the news source.
  var name: String?
  /// Description
  var description: String?
  /// URL link
  var url: String?
  /// Turns the news source on or off. If it's off, there will be no news retrieved from it.
  var selected: Bool
  
  /// Initialise using parameter.
  init(id: String, name: String?, description: String?, url: String?, selected: Bool) {
    self.id = id
    self.name = name
    self.description = description
    self.url = url
    self.selected = selected
  }
  /// Use to decode from JSON.
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    description = try values.decodeIfPresent(String.self, forKey: .description)
    url = try values.decode(String.self, forKey: .url)
    selected = try values.decodeIfPresent(Bool.self, forKey: .selected) ?? false
  }

  enum CodingKeys: String, CodingKey {
    case id, name, description, url, selected
  }
}

// MARK: - Equatable
/// For checking equal values to avoid duplication in arrays.
extension Source: Equatable {
  /// Checks if the news sources are the same
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
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
