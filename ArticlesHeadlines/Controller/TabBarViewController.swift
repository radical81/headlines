//
//  TabBarViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let first = createTabItem(with: "Test", and: UIImage(systemName: "mail"), vc: MainViewController())
        setViewControllers([first], animated: true)
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
