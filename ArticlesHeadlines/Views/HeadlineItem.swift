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
  
  var title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .blue
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  func initSubviews() {
    title.textAlignment = .center
    title.text = headline?.title ?? "No title"
    title.sizeToFit()
    addSubview(title)
  }
}
