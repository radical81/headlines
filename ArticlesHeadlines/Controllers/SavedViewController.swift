//
//  SavedViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class SavedViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(SavedItems(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)))
  }
}
