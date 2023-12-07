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
      let confirmation = generateConfirmation {
        self.delete(at: indexPath)
      }
      self.present(confirmation, animated: true)
    }
  }

  /// Row selection
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.navigationController?.pushViewController(ArticleViewController(headlines[indexPath.row]), animated: true)
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
  func delete(at indexPath: IndexPath) {
    LocalStore().deleteHeadline(headlines[indexPath.row].headline)
    headlines.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .fade)
  }
  
  /// Generate confirmation dialog
  func generateConfirmation(action: @escaping () -> Void) -> UIAlertController {
    // Declare Alert message
    let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
    
    // Create OK button with action handler
    let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
      action()
    })
    
    // Create Cancel button with action handlder
    let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
    
    //Add OK and Cancel button to dialog message
    dialogMessage.addAction(ok)
    dialogMessage.addAction(cancel)
    
    return dialogMessage
  }
}
