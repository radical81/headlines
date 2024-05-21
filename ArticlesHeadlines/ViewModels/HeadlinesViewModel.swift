//
//  HeadlinesViewModel.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 19/2/2024.
//

import Foundation

/// View model representing the collection of headlines.
class HeadlinesViewModel {
  var dataForLoading: Loadable<[Headline]> = .notLoaded {
    didSet {
      switch dataForLoading {
      case .loaded(let data):
        headlines = data
      default:
        break
      }
    }
  }
  
  /// The collection of headlines if they are loaded.
  var headlines: [Headline] = []

  // MARK: - Computed Properties
  /// The collection of headlines represented by individual view models for each headline.
  var headlineViewModels: [HeadlineViewModel] {
    headlines.map { HeadlineViewModel($0) }
  }
  
  /// Retrieve any error messages.
  var errorMessage: ErrorWithMessage? {
    switch dataForLoading {
    case .failed(let error):
      if let error = error as? ErrorWithMessage {
        return error
      }
    default:
      return nil
    }
    return nil
  }

  // MARK: - Methods
  /// Fetch data
  func fetchHeadlines() async {
    dataForLoading = .loading
    dataForLoading = await Shared.news.fetchHeadlines([])
  }
  
  /// Fetch saved headlines from storage.
  func fetchSavedHeadlines() {
    headlines = []
    let savedHeadlines = Shared.storage.savedHeadlines
    savedHeadlines.forEach { headline in
      headlines.append(headline)
    }
  }
  
  /// Delete row and remove from store.
  func delete(at indexPath: IndexPath) {
    Shared.storage.deleteHeadline(headlines[indexPath.row])
    headlines.remove(at: indexPath.row)    
  }
}
