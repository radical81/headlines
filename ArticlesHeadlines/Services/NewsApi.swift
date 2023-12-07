//
//  NewsApi.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Implements the NewsRetriever protocol with the News API as the data source.
struct NewsApi: NewsRetriever {
  
  /// News API base URL.
  var baseUrl: String {
    "https://newsapi.org"
  }
  
  /// Fetches the headlines.
  func fetchHeadlines(_ sources: [Source]) async -> Loadable<[Headline]> {
//    guard let url = URL(String: base)
    return .notLoaded
  }
  
  /// Retrieve news sources.
  func fetchSources() async -> Loadable<[Source]> {
    return .notLoaded
  }
}
