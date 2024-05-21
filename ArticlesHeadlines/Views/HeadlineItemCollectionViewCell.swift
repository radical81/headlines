//
//  HeadlineItemCollectionViewCell.swift
//  ArticlesHeadlines
//

import UIKit

/// The collection view cell for the fresh headlines.
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
    decorateCell()
    addSubview(headlineItem)
  }
  
  func decorateCell() {
    headlineItem.layer.borderColor = UIColor.lightGray.cgColor
    headlineItem.layer.borderWidth = 1
    headlineItem.layer.cornerRadius = 5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
