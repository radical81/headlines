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
  
  // MARK: - Data source
  var headline: HeadlineViewModel? {
    didSet {
      updateWithData()
    }
  }
  
  // MARK: - Display elements
  var title = UILabel()
  var summary = UILabel()
  var author = UILabel()
  var verticalStack = UIStackView()
  var thumbnail = UIImageView(image: UIImage(systemName: "photo"))
  var horizontalStack = UIStackView()
  
  // MARK: - Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initSubviews() {
    decorateThumbnail()
    decorateTitle()
    decorateSummary()
    decorateAuthor()
    decorateVerticalStack()
    decorateHorizontalStack()
    addSubview(horizontalStack)
  }
  
  /// Updates UI with data from view model.
  func updateWithData() {
    guard let headline = headline else {
      return
    }
    title.text = headline.title
    summary.text = headline.description
    author.text = headline.author
    guard let url = headline.imageUrl else {
      return
    }
    Task {
      try await thumbnail.loadFromUrl(url)
    }
  }
  
  // MARK: - Decorate UI layout
  
  func decorateVerticalStack() {
    verticalStack.addArrangedSubview(title)
    verticalStack.addArrangedSubview(summary)
    verticalStack.addArrangedSubview(author)
    verticalStack.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    verticalStack.isLayoutMarginsRelativeArrangement = true
    verticalStack.axis = .vertical
    verticalStack.distribution = .equalSpacing
    verticalStack.spacing = 20
  }
  
  func decorateTitle() {
    title.font = UIFont.boldSystemFont(ofSize: 16)
    title.textAlignment = .left
  }
  
  func decorateThumbnail() {
    thumbnail.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    thumbnail.contentMode = .scaleToFill
    thumbnail.widthAnchor.constraint(equalToConstant: 100).isActive = true
    thumbnail.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func decorateHorizontalStack() {
    horizontalStack.addArrangedSubview(thumbnail)
    horizontalStack.addArrangedSubview(verticalStack)
    horizontalStack.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 150)
    horizontalStack.isLayoutMarginsRelativeArrangement = true
    horizontalStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
    horizontalStack.axis = .horizontal
    horizontalStack.distribution = .fillProportionally
    horizontalStack.alignment = .center
    horizontalStack.spacing = 20
  }

  func decorateSummary() {
    summary.textAlignment = .justified
    summary.lineBreakMode = .byTruncatingTail
    summary.numberOfLines = 2
  }
  
  func decorateAuthor() {
    author.textAlignment = .left
  }
}
