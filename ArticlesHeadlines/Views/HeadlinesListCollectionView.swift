//
//  HeadlinesListCollectionView.swift
//  ArticlesHeadlines
//

import UIKit

/// The collection view for the list of fresh headlines.
class HeadlinesListCollectionView: UICollectionView {

  init(frame: CGRect) {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    layout.itemSize = CGSize(width: frame.size.width - 20, height: 150)
    super.init(frame: frame, collectionViewLayout: layout)
  }
  
  var widestCellWidth: CGFloat {
      let insets = contentInset.left + contentInset.right
      return bounds.width - insets
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
