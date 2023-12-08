//
//  Shared.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Keeps track of a singleton that stores services.
struct Shared {
  /// An Instance of the news retriever.
  /// It is of type NewsRetriever and the implementation instance is NewsAPI(). This can be changed later on to point to a different API.
  static let news: NewsRetriever = NewsApi()
  /// An instance of the local store.
  static let storage: Storage = LocalStore()
}
