//
//  HeadlineItem.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation
import UIKit

/// Represents a single item in the list of headlines.
class HeadlineItem: UICollectionViewCell {
  
  var headline: HeadlineViewModel? {
    didSet {
      title.text = headline?.title ?? "No title"
    }
  }
  
  var title = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    decorateCell()
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initSubviews() {
    decorateTitle()
    addSubview(title)
  }
  
  func decorateCell() {
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 5
  }
  
  func decorateTitle() {
    title.frame = CGRect(x: 0, y: 20, width: self.bounds.width, height: 20)
    title.textAlignment = .center
    title.text = headline?.title ?? "No title"
  }
}
