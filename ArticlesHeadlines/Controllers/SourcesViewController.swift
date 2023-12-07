//
//  SourcesViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class SourcesViewController: UITableViewController {
  
  /// The data source for this list.
  var sources: [SourceViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(SourceItem.self, forCellReuseIdentifier: "SourcesList")
    tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    tableView.allowsMultipleSelection = true
    fetchData()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sources.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SourcesList", for: indexPath) as? SourceItem else {
      return UITableViewCell()
    }
    cell.source = sources[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var newValue = sources[indexPath.row].source
    newValue.selected = true
    sources[indexPath.row].source = newValue
    LocalStore().saveNewsSource(newValue)
    if let cell = tableView.cellForRow(at: indexPath) as? SourceItem {
      cell.source = sources[indexPath.row]
      cell.isSelected = true
      cell.updateWithData()
    }
  }
  
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    var newValue = sources[indexPath.row].source
    newValue.selected = false
    sources[indexPath.row].source = newValue
    LocalStore().saveNewsSource(newValue)
    if let cell = tableView.cellForRow(at: indexPath) as? SourceItem {
      cell.source = sources[indexPath.row]
      cell.isSelected = false
      cell.updateWithData()
    }
  }

  /// Fetch data
  func fetchData() {
    //TODO: Real data
    var freshLoad = [
      SourceViewModel(Source(name: "abc", description: "local AU news", selected: true)),
      SourceViewModel(Source(name: "sky news", selected: true))
    ]
    let sourcesFromStore = LocalStore().newsSources
    for i in freshLoad.indices {
      if let match = sourcesFromStore.findMatch(freshLoad[i].source) {
        freshLoad[i].source.selected = match.selected
      }
    }
    sources = freshLoad
    print(sources)
  }
}
