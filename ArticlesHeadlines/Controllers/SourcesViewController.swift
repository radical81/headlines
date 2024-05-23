//
//  SourcesViewController.swift
//  ArticlesHeadlines
//

import UIKit

/// List of news sources from which to retrieve headlines.
/// The user can select or deselect which sources to get news from.
class SourcesViewController: UITableViewController {
  /// The view model for this collection of news sources.
  var viewModel: SourcesViewModel = SourcesViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(SourceItem.self, forCellReuseIdentifier: "SourcesList")
    tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    tableView.allowsMultipleSelection = true
    Task {
      await viewModel.fetchData()
      tableView.reloadData()
    }
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.sources.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SourcesList", for: indexPath) as? SourceItem else {
      return UITableViewCell()
    }
    cell.source = viewModel.sources[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var newValue = viewModel.sources[indexPath.row]
    if newValue.selected == true {
      newValue.selected = false
    } else {
      newValue.selected = true
    }
    viewModel.sources[indexPath.row] = newValue
    Shared.storage.saveNewsSource(newValue)
    if let cell = tableView.cellForRow(at: indexPath) as? SourceItem {
      cell.source = viewModel.sources[indexPath.row]
      cell.updateWithData()
    }
  }
  
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    var newValue = viewModel.sources[indexPath.row]
    newValue.selected = false
    viewModel.sources[indexPath.row] = newValue
    Shared.storage.saveNewsSource(newValue)
    if let cell = tableView.cellForRow(at: indexPath) as? SourceItem {
      cell.source = viewModel.sources[indexPath.row]
      cell.updateWithData()
    }
  }
}
