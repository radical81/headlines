//
//  Shared.swift
//  ArticlesHeadlines
//

import Foundation

/// Keeps track of a singleton that stores services.
struct Shared {
  /// An Instance of the news retriever.
  /// It is of type NewsRetriever and the implementation instance is NewsAPI() in the main target, and MockNews() for UI testing. This can be changed later on to point to different APIs.
  static var news: NewsRetriever {
    if ProcessInfo.processInfo.arguments.contains("UITest") {
      return MockNews()
    } else {
      return NewsApi()
    }
  }
  /// An instance of the local store.
  static let storage: Storage = LocalStore()
}
