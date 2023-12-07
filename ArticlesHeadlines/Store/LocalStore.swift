//
//  LocalStore.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import Foundation

/// Convenience functions for managing local store.
struct LocalStore {
  // MARK: - Properties
  let store = UserDefaults.standard
  let newsSourcesKey = "newsSources"
  let savedHeadlinesKey = "savedHeadlines"
  /// JSON encoder
  let encoder = JSONEncoder()
  // JSON Decoder
  let decoder = JSONDecoder()
  
  // MARK: - News sources
  /// Retrieve news sources
  var newsSources: [Source] {
    if let data = store.data(forKey: newsSourcesKey) {
      do {
        let newsSources = try decoder.decode([Source].self, from: data)
        return newsSources
      } catch {
        print("Error decoding news source. (\(error))")
      }
    }
    return []
  }
  
  /// Store news sources
  func saveNewsSource(_ source: Source) {
    var currentSources = newsSources
    currentSources.removeAll {
      $0 == source
    }
    currentSources.append(source)
//    print("\(currentSources)\n\n")
    do {
      let data = try encoder.encode(currentSources)
      store.set(data, forKey: newsSourcesKey)
    } catch {
      print("Error encoding news source. (\(error)")
    }
  }
}
