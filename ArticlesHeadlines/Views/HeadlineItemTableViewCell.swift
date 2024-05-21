//
//  HeadlineItemTableViewCell.swift
//  ArticlesHeadlines
//

import UIKit

/// The table cell for the Saved headlines table.
class HeadlineItemTableViewCell: UITableViewCell {
  // MARK: - Data source
  var headline: HeadlineViewModel? {
    didSet {
      headlineItem.headline = headline
    }
  }
  
  // MARK: - View
  var headlineItem = HeadlineItemView()

  //MARK: - Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    headlineItem = HeadlineItemView()
    addSubview(headlineItem)
    decorateHeadlineItem()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func decorateHeadlineItem() {
    headlineItem.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      headlineItem.topAnchor.constraint(equalTo: topAnchor),
      headlineItem.bottomAnchor.constraint(equalTo: bottomAnchor),
      headlineItem.leadingAnchor.constraint(equalTo: leadingAnchor),
      headlineItem.trailingAnchor.constraint(equalTo: trailingAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
