//
//  SourcesViewModel.swift
//  ArticlesHeadlines
//

import Foundation

/// View model representing the collection of sources.
class SourcesViewModel {
  /// The data source
  var sources: [Source] = []
  
  /// The data source for the list.
  var dataForLoading: Loadable<[Source]> = .notLoaded {
    didSet {
      switch dataForLoading {
      case .loaded(let data):
        let sourcesFromStore = Shared.storage.newsSources
        // Make sure that if the source in store is already selected, it will continue to be selected.
        var freshData = data
        for i in freshData.indices {
          if let match = sourcesFromStore.findMatch(freshData[i]), match.selected == true{
            freshData[i].selected = true // Overwrite fresh data with store's values
          }
        }
        sources = freshData
      default:
        break
      }
    }
  }
  
  // MARK: - Methods
  /// Fetch data
  func fetchData() async {
    dataForLoading = .loading
    dataForLoading = await Shared.news.fetchSources()
  }  
}
