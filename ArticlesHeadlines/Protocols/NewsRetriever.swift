//
//  NewsRetriever.swift
//  ArticlesHeadlines
//

import Foundation

/// Hides the implementation of API calls to the news service.
protocol NewsRetriever {
  /// The API key.
  var apiKey: String { get }
  /// News source base URL.
  var baseUrl: String { get }
  /// Fetches the headlines.
  func fetchHeadlines() async -> Loadable<[Headline]>
  /// Retrieve news sources.
  func fetchSources() async -> Loadable<[Source]>
}
