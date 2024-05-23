//
//  SourceItem.swift
//  ArticlesHeadlines
//

import UIKit

/// Represents a single item in the list of sources.
class SourceItem: UITableViewCell {
  
  //MARK: - Data Source
  var source: SourceItemViewModel? {
    didSet {
      updateWithData()
    }
  }

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
    addSubview(hStack)
    decorateHStack()
    decorateSelected()
  }
  
  func decorateCell() {
    self.selectionStyle = .none
  }
  
  func decorateHStack() {
    hStack.isLayoutMarginsRelativeArrangement = true
    hStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
    hStack.axis = .horizontal
    hStack.distribution = .equalSpacing
    hStack.alignment = .leading
    hStack.addArrangedSubview(name)
    hStack.addArrangedSubview(tick)
    hStack.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      hStack.topAnchor.constraint(equalTo: topAnchor),
      hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func decorateSelected() {
    tick.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      tick.centerXAnchor.constraint(equalTo: hStack.trailingAnchor, constant: -30)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  
  func decorateName() {
    name.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    name.font = UIFont.boldSystemFont(ofSize: 16)
  }
}
