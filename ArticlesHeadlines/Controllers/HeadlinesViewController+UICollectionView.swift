//
//  HeadlinesViewController+UICollectionView.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation
import UIKit

/// Implementation of UICollectionView delegate and data source.
extension HeadlinesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.headlineViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let headlineItem = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadlineList", for: indexPath) as? HeadlineItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    headlineItem.headline = viewModel.headlineViewModels[indexPath.row]
    return headlineItem
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let article = ArticleViewController(viewModel.headlineViewModels[indexPath.row])
    article.showSaveButton = true
    self.navigationController?.pushViewController(article, animated: true)
  }
  
  @objc func handleRefreshControl() {
    // Refresh content
    Task {
      await viewModel.fetchHeadlines()
      // Dismiss the refresh control.
      DispatchQueue.main.async {
        self.headlinesList?.refreshControl?.endRefreshing()
      }
    }
  }
}
