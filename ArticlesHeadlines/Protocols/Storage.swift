//
//  Storage.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

protocol Storage {
  // MARK: - Properties
  /// News source key
  var newsSourcesKey: String { get }
  /// Headlines key
  var savedHeadlinesKey: String { get }
  
  // MARK: - Saved Headlines
  /// Retrieve saved headlines
  var savedHeadlines: [Headline] { get }
  
  /// Store headlines
  func saveHeadline(_ headline: Headline) throws

  /// Delete headline
  func deleteHeadline(_ headline: Headline)

  // MARK: - News sources
  /// Retrieve news sources
  var newsSources: [Source] { get }
  
  /// Store news sources
  func saveNewsSource(_ source: Source)
}
