//
//  SourcesViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class SourcesViewController: UITableViewController {
  
  /// The data source for the list.
  var dataForLoading: Loadable<[Source]> = .notLoaded {
    didSet {
      switch dataForLoading {
      case .loaded(let data):
        sources = data.map {
          SourceViewModel($0)
        }
      default:
        break
      }
    }
  }

  /// The view model instances for the list.
  var sources: [SourceViewModel] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(SourceItem.self, forCellReuseIdentifier: "SourcesList")
    tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    tableView.allowsMultipleSelection = true
    Task {
      await fetchData()
    }
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
    if newValue.selected == true {
      newValue.selected = false
    } else {
      newValue.selected = true
    }
    sources[indexPath.row].source = newValue
    LocalStore().saveNewsSource(newValue)
    if let cell = tableView.cellForRow(at: indexPath) as? SourceItem {
      cell.source = sources[indexPath.row]
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
      cell.updateWithData()
    }
  }

  /// Fetch data
  func fetchData() async {
    dataForLoading = await ApiInstance.shared.fetchSources()
    let sourcesFromStore = LocalStore().newsSources
    for i in sources.indices {
      if let match = sourcesFromStore.findMatch(sources[i].source) {
        sources[i].source = match
      }
    }
    print(sources)
  }
}
