//
//  HeadlinesViewController+UICollectionView.swift
//  ArticlesHeadlines
//

import Foundation
import UIKit

/// Implementation of UICollectionView data source protocol..
extension HeadlinesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.headlines.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let headlineItem = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadlineList", for: indexPath) as? HeadlineItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    headlineItem.headline = viewModel.headlines[indexPath.row]
    return headlineItem
  }
}
/// Implementation of UICollectionView delegate protocol.
extension HeadlinesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let article = ArticleViewController(viewModel.headlines[indexPath.row])
    article.showSaveButton = true
    self.navigationController?.pushViewController(article, animated: true)
  }  
}
