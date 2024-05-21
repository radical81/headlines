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
    addSubview(horizontalStack)
    decorateHorizontalStack()
    decorateThumbnail()
    decorateVerticalStack()
    decorateTitle()
    decorateSummary()
    decorateAuthor()
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
    verticalStack.isLayoutMarginsRelativeArrangement = true
    verticalStack.axis = .vertical
    verticalStack.distribution = .equalSpacing
    verticalStack.alignment = .top
    verticalStack.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      verticalStack.topAnchor.constraint(equalTo: thumbnail.topAnchor),
      verticalStack.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 10),
      verticalStack.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor),
      verticalStack.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor, constant: -10)
    ]
    NSLayoutConstraint.activate(constraints)
  }
    
  func decorateThumbnail() {
    thumbnail.contentMode = .scaleToFill
    thumbnail.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      thumbnail.centerYAnchor.constraint(equalTo: horizontalStack.centerYAnchor),
      thumbnail.heightAnchor.constraint(equalTo: horizontalStack.heightAnchor, multiplier: 0.8),
      thumbnail.widthAnchor.constraint(equalTo: thumbnail.heightAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  
  func decorateHorizontalStack() {
    horizontalStack.addArrangedSubview(thumbnail)
    horizontalStack.addArrangedSubview(verticalStack)
    horizontalStack.isLayoutMarginsRelativeArrangement = true
    horizontalStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
    horizontalStack.axis = .horizontal
    horizontalStack.distribution = .fillProportionally
    horizontalStack.alignment = .center
    horizontalStack.spacing = 20
    horizontalStack.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      horizontalStack.topAnchor.constraint(equalTo: topAnchor),
      horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  
  func decorateTitle() {
    title.font = UIFont.boldSystemFont(ofSize: 16)
    title.textAlignment = .left
    title.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      title.topAnchor.constraint(equalTo: verticalStack.topAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
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
