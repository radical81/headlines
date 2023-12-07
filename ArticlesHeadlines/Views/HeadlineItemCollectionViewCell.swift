//
//  HeadlineItemCollectionViewCell.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import UIKit

class HeadlineItemCollectionViewCell: UICollectionViewCell {
  // MARK: - Data source
  var headline: HeadlineViewModel? {
    didSet {
      headlineItem.headline = headline
    }
  }
  
  // MARK: - View
  var headlineItem = HeadlineItem()

  // MARK: - Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    headlineItem = HeadlineItem(frame: self.bounds)
    addSubview(headlineItem)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
