//
//  HeadlinesViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class HeadlinesViewController: UIViewController {
  
//  /// The API service retrieve the headlines.
//  let api: NewsRetriever

  /// The list of headlines, a collection view.
  var headlinesList: HeadlinesList?
  
  /// The data source for the list.
  var dataForLoading: Loadable<[Headline]> = .notLoaded {
    didSet {
      switch dataForLoading {
      case .loaded(let data):
        headlines = data.map {
          HeadlineViewModel($0)
        }
      default:
        break
      }
    }
  }
  
  /// The view model instances for the list.
  var headlines: [HeadlineViewModel] = [] {
    didSet {
      headlinesList?.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    headlinesList = HeadlinesList(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
    headlinesList?.register(HeadlineItemCollectionViewCell.self, forCellWithReuseIdentifier: "HeadlineList")
    headlinesList?.dataSource = self
    headlinesList?.delegate = self
    view.addSubview(headlinesList ?? UICollectionView())
    Task {
      await fetchHeadlines()
      switch dataForLoading {
      case .failed(let error):
        if let error = error as? ErrorWithMessage {
          self.present(UIAlertController.errorAlert(title: "Error", message: error.message), animated: true)
        }
      default:
        break
      }
    }
  }
  
  /// Fetch data/
  func fetchHeadlines() async {
    dataForLoading = .loading
    dataForLoading = await ApiInstance.shared.fetchHeadlines([])
  }
}
