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
    headlines.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let headlineItem = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadlineList", for: indexPath) as? HeadlineItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    headlineItem.headline = headlines[indexPath.row]
    return headlineItem
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}
