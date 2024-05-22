//
//  HeadlineItemTableViewCell.swift
//  ArticlesHeadlines
//

import UIKit

/// The table cell for the Saved headlines table.
class HeadlineItemTableViewCell: UITableViewCell {
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

  //MARK: - Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    headlineItemView = HeadlineItemView()
    addSubview(headlineItemView)
    decorateHeadlineItem()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func decorateHeadlineItem() {
    headlineItemView.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      headlineItemView.topAnchor.constraint(equalTo: topAnchor),
      headlineItemView.bottomAnchor.constraint(equalTo: bottomAnchor),
      headlineItemView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headlineItemView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
