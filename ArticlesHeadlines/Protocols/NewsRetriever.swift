//
//  NewsRetriever.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Hides the implementation of API calls to the news service.
protocol NewsRetriever {
  /// News source base URL.
  var baseUrl: String { get }
  /// Fetches the headlines.
  func fetchHeadlines(_ sources: [Source]) async -> Loadable<[Headline]>
  /// Retrieve news sources.
  func fetchSources() async -> Loadable<[Source]>
}
