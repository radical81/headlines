//
//  TabBarViewController.swift
//  ArticlesHeadlines
//

import UIKit

class TabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let headlines = createTabItem(with: "Headlines", and: UIImage(systemName: "newspaper"), vc: HeadlinesViewController())
    let sources = createTabItem(with: "Sources", and: UIImage(systemName: "cloud"), vc: SourcesViewController())
    let saved = createTabItem(with: "Saved", and: UIImage(systemName: "square.and.arrow.down"), vc: SavedViewController())
    setViewControllers([headlines, sources, saved], animated: true)
  }
  
  
  // MARK: - Tab Setup
  private func createTabItem(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: vc)
    nav.tabBarItem.title = title
    nav.tabBarItem.image = image
    nav.viewControllers.first?.navigationItem.title = title
    return nav
  }
}
