//
//  LocalStore.swift
//  ArticlesHeadlines
//

import Foundation

/// Convenience functions for managing local store.
struct LocalStore: Storage {
  // MARK: - Properties
  let store = UserDefaults.standard
  /// News source key
  var newsSourcesKey: String {
    "newsSources"
  }
  /// Headlines key
  var savedHeadlinesKey: String {
    "savedHeadlines"
  }
  /// JSON encoder
  let encoder = JSONEncoder()
  // JSON Decoder
  let decoder = JSONDecoder()
  
  // MARK: - Saved Headlines
  /// Retrieve saved headlines
  var savedHeadlines: [Headline] {
    if let data = store.data(forKey: savedHeadlinesKey) {
      do {
        let headlines = try decoder.decode([Headline].self, from: data)
        return headlines
      } catch {
        print("Error decoding saved headlines. (\(error))")
      }
    }
    return []
  }
  
  /// Store headlines
  func saveHeadline(_ headline: Headline) throws {
    var currentHeadlines = savedHeadlines
    currentHeadlines.removeAll {
      $0 == headline
    }
    currentHeadlines.append(headline)
    do {
      let data = try encoder.encode(currentHeadlines)
      store.set(data, forKey: savedHeadlinesKey)
    } catch {
      throw StoreError.saveFailed("Failed to save headline. Please try again.")
    }
  }

  /// Delete headline
  func deleteHeadline(_ headline: Headline) {
    var currentHeadlines = savedHeadlines
    currentHeadlines.removeAll {
      $0 == headline
    }
    do {
      let data = try encoder.encode(currentHeadlines)
      store.set(data, forKey: savedHeadlinesKey)
    } catch {
      print("Error encoding headline. (\(error)")
    }
  }

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
    do {
      let data = try encoder.encode(currentSources)
      store.set(data, forKey: newsSourcesKey)
    } catch {
      print("Error encoding news source. (\(error)")
    }
  }
}
