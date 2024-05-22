//
//  HeadlineItemCollectionViewCell.swift
//  ArticlesHeadlines
//

import UIKit

/// The collection view cell for the fresh headlines.
class HeadlineItemCollectionViewCell: UICollectionViewCell {
  // MARK: - Data source
  var headline: Headline? {
    didSet {
      if let headline = headline {
        headlineItemView.viewModel = HeadlineItemViewModel(headline)
      }
    }
  }
  
  // MARK: - View
  var headlineItemView = HeadlineItemView()

  // MARK: - Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    headlineItemView = HeadlineItemView(frame: self.bounds)
    decorateCell()
    addSubview(headlineItemView)
  }
  
  func decorateCell() {
    headlineItemView.layer.borderColor = UIColor.lightGray.cgColor
    headlineItemView.layer.borderWidth = 1
    headlineItemView.layer.cornerRadius = 5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
