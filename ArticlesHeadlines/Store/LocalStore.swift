//
//  LocalStore.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import Foundation

/// Convenience functions for managing local store.
struct LocalStore {
  let store = UserDefaults.standard
  let sourcePreferencesKey = "newsSources"
  let savedHeadlines = "savedHeadlines"
  
  
  // MARK: - News sources
  /// Retrieve news sources
  var newsSources: [Source] {
    guard let result = store.array(forKey: sourcePreferencesKey) as? [Source] else {
      return []
    }
    return result
  }
  
  /// Store news sources
  func saveNewsSource(_ source: Source) {
    var currentSources = newsSources
    currentSources.append(source)
    store.set(currentSources, forKey: sourcePreferencesKey)
  }
}
