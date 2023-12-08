//
//  ApiInstance.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Keeps track of the instance of the API.
struct ApiInstance {
  /// Shared is an instance of the news retriever.
  /// It is of type NewsRetriever and the implementation instance is NewsAPI(). This can be changed later on to point to a different API.
  static let shared: NewsRetriever = NewsApi()
}
