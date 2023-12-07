//
//  Article.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation
import UIKit
import WebKit

/// View that shows one news article.
class Article: UIView, WKUIDelegate {
  // MARK: - Data source
  var headline: HeadlineViewModel? {
    didSet {
      updateWithData()
    }
  }
  
  // MARK: - Display elements
  var webView: WKWebView?
  
  // MARK: - Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .systemBackground
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func updateWithData() {
    guard let headline = headline else {
      return
    }
  }
  
  func initSubviews() {
    
  }
}
