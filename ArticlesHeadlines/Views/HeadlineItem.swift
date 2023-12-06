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
  var stackView = UIStackView()
  var thumbnail = UIImageView(image: UIImage(systemName: "photo"))
  var heading = UIStackView()
  
  // MARK: - Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    decorateCell()
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initSubviews() {
    decorateThumbnail()
    decorateTitle()
    decorateHeading()
    decorateSummary()
    decorateAuthor()
    decorateStackView()
    addSubview(stackView)
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
  
  func decorateCell() {
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 5
  }
  
  func decorateStackView() {
    stackView.addArrangedSubview(heading)
    stackView.addArrangedSubview(summary)
    stackView.addArrangedSubview(author)
    stackView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  }
  
  func decorateTitle() {
    title.font = UIFont.boldSystemFont(ofSize: 16)
    title.textAlignment = .left
  }
  
  func decorateThumbnail() {
    thumbnail.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    thumbnail.contentMode = .scaleToFill
    thumbnail.widthAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  func decorateHeading() {
    heading.addArrangedSubview(thumbnail)
    heading.addArrangedSubview(title)
    heading.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 50)
    heading.isLayoutMarginsRelativeArrangement = true
    heading.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    heading.axis = .horizontal
    heading.distribution = .fillProportionally
    heading.alignment = .leading
    heading.spacing = 10
    heading.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }

  func decorateSummary() {
    summary.textAlignment = .justified
    summary.lineBreakMode = .byWordWrapping
    summary.numberOfLines = 0
  }
  
  func decorateAuthor() {
    author.textAlignment = .left
  }
}
