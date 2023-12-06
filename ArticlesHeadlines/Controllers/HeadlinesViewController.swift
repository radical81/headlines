//
//  HeadlinesViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class HeadlinesViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(HeadlinesList(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)))
  }
}
