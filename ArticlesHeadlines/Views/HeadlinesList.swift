//
//  HeadlinesList.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class HeadlinesList: UICollectionView {

  init(frame: CGRect) {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    layout.itemSize = CGSize(width: 60, height: 60)
    super.init(frame: frame, collectionViewLayout: layout)
  }
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    self.backgroundColor = .systemBackground
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
