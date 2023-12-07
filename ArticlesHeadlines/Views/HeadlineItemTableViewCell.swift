//
//  HeadlineItemTableViewCell.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import UIKit

class HeadlineItemTableViewCell: UITableViewCell {
  // MARK: - Data source
  var headline: HeadlineViewModel? {
    didSet {
      headlineItem.headline = headline
    }
  }
  
  // MARK: - View
  var headlineItem = HeadlineItem()

  //MARK: - Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    headlineItem = HeadlineItem(frame: CGRect(x: 10, y: 10, width: self.bounds.width, height: self.bounds.height))
    decorateHeadlineItem()
    decorateCell()
    addSubview(headlineItem)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func decorateCell() {
    
    
  }
  
  func decorateHeadlineItem() {
    let frame = headlineItem.horizontalStack.frame
    headlineItem.horizontalStack.frame = CGRect(x: 0, y: 0, width: frame.width + 50, height: frame.height)
  }
}
