//
//  HeadlineItem.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation
import UIKit

/// Represents a single item in the list of headlines.
class HeadlineItem: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .systemBackground
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func initSubviews() {
    
  }
}
