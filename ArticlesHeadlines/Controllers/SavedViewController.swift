//
//  SavedViewController.swift
//  ArticlesHeadlines
//

import UIKit

class SavedViewController: UITableViewController {

  /// The view model for this collection of headlines.
  var viewModel: SavedHeadlinesViewModel = SavedHeadlinesViewModel()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(HeadlineItemTableViewCell.self, forCellReuseIdentifier: "SavedHeadlinesList")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    viewModel.fetchSavedHeadlines()
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.headlineViewModels.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedHeadlinesList", for: indexPath) as? HeadlineItemTableViewCell else {
      return UITableViewCell()
    }
    cell.viewModel = viewModel.headlineViewModels[indexPath.row]
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
      let confirmation = UIAlertController.confirmDelete {
        self.viewModel.delete(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
      self.present(confirmation, animated: true)
    }
  }

  /// Row selection
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let article = ArticleViewController(viewModel.headlineViewModels[indexPath.row])
    article.showDeleteButton = true
    self.navigationController?.pushViewController(article, animated: true)
  }
}
