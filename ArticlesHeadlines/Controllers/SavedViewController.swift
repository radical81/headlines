//
//  SavedViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import UIKit

class SavedViewController: UITableViewController {

  /// The data source for the list.
  var headlines: [HeadlineViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(HeadlineItemTableViewCell.self, forCellReuseIdentifier: "SavedHeadlinesList")
    tableView.allowsSelection = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    fetchData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return headlines.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedHeadlinesList", for: indexPath) as? HeadlineItemTableViewCell else {
      return UITableViewCell()
    }
    cell.headline = headlines[indexPath.row]
    return cell
  }
     
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    150
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    150
  }

  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.layoutIfNeeded()
  }


  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // Delete the row from the data source
      delete(headlines[indexPath.row])
      headlines.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }

  
  /// Fetch data/
  func fetchData() {
    //TODO: Real data
    headlines = []
    let savedHeadlines = LocalStore().savedHeadlines
    savedHeadlines.forEach { headline in
      headlines.append(HeadlineViewModel(headline))
    }
    tableView.reloadData()
  }
  
  /// Delete row and remove from store.
  func delete(_ headline: HeadlineViewModel) {
    LocalStore().deleteHeadline(headline.headline)
  }
}
