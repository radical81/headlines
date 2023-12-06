//
//  HeadlinesViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class HeadlinesViewController: UIViewController {
  

  /// The list of headlines, a collection view.
  var headlinesList: HeadlinesList?
  
  /// The data source for the list.
  var headlines: [HeadlineViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    headlinesList = HeadlinesList(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
    headlinesList?.register(HeadlineItem.self, forCellWithReuseIdentifier: "HeadlineList")
    headlinesList?.dataSource = self
    headlinesList?.delegate = self
    view.addSubview(headlinesList ?? UICollectionView())
    fetchHeadlines()
  }
  
  /// Fetch data/
  func fetchHeadlines() {
    //TODO: Real data
    headlines = [
      HeadlineViewModel(Headline(title: "test", description: "testing", author: "rex", urlToImage: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_766206_17017494326985532.jpg")),
      HeadlineViewModel(Headline(title: "test 2", description: "testing again", author: "rex", urlToImage: "")),
      HeadlineViewModel(Headline(title: "test", description: "testing", author: "rex", urlToImage: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_766206_17017494326985532.jpg")),
      HeadlineViewModel(Headline(title: "test 2", description: "testing again", author: "rex", urlToImage: "")),
    ]
  }
}
