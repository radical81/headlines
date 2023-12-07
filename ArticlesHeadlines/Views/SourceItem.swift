//
//  SourceItem.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import UIKit

/// Represents a single item in the list of sources.
class SourceItem: UITableViewCell {
  
  //MARK: - Data Source
  var source: SourceViewModel? {
    didSet {
      updateWithData()
    }
  }

  // MARK: - Local Store
  let store = LocalStore()

  // MARK: - Display elements
  var hStack = UIStackView()
  var name = UILabel()
  var tick = UIImageView(image: UIImage(systemName: "checkmark"))

  //MARK: - Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    decorateCell()
    initSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  func updateWithData() {
    if let source = source {
      name.text = source.name
      tick.isHidden =  !source.isSelected
    }
  }
  
  func initSubviews() {
    decorateName()
    decorateSelected()
    decorateHStack()
    addSubview(hStack)
  }
  
  func decorateCell() {
    self.selectionStyle = .none
  }
  
  func decorateHStack() {
    hStack.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    hStack.isLayoutMarginsRelativeArrangement = true
    hStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
    hStack.axis = .horizontal
    hStack.distribution = .equalSpacing
    hStack.alignment = .leading
    hStack.addArrangedSubview(name)
    hStack.addArrangedSubview(tick)
  }

  func decorateSelected() {
    tick.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
  }
  
  func decorateName() {
    name.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    name.font = UIFont.boldSystemFont(ofSize: 16)
  }
}
