//
//  HeadlinesViewController.swift
//  ArticlesHeadlines
//

import UIKit

/// Lists the headlines available to the user for viewing.
class HeadlinesViewController: UIViewController {
  
  /// The list of headlines, a collection view.
  var headlinesList: HeadlinesListCollectionView?
  
  /// The view model for this collection of headlines. Inject news source API on initialisation.
  var viewModel: HeadlinesViewModel = HeadlinesViewModel(source: Shared.news)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    headlinesList = HeadlinesListCollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
    headlinesList?.register(HeadlineItemCollectionViewCell.self, forCellWithReuseIdentifier: "HeadlineList")
    headlinesList?.dataSource = self
    headlinesList?.delegate = self
    headlinesList?.refreshControl = UIRefreshControl()
    headlinesList?.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    view.addSubview(headlinesList ?? UICollectionView())
    Task {
      await viewModel.fetchHeadlines()
      if let error = viewModel.errorMessage {
        self.present(UIAlertController.errorAlert(title: "Error", message: error.message), animated: true)
      }
      headlinesList?.reloadData()
    }
  }
}
