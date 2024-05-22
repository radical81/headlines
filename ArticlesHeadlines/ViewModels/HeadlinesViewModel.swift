//
//  HeadlinesViewModel.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 19/2/2024.
//

import Foundation

/// View model representing the collection of headlines.
class HeadlinesViewModel {
  var source: NewsRetriever
  
  init(source: NewsRetriever) {
    self.source = source
  }
  
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
    dataForLoading = await source.fetchHeadlines()
  }
}
