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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
  /// Fetch data/
  func fetchData() {
    //TODO: Real data
    headlines = [
      HeadlineViewModel(Headline(title: "test", description: "testing lots of lots of text the quick brown fox jumps over the lazy dog near the river bank", author: "rex", urlToImage: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_766206_17017494326985532.jpg")),
      HeadlineViewModel(Headline(title: "test 2", description: "testing again", author: "rex", urlToImage: "")),
      HeadlineViewModel(Headline(title: "test", description: "testing", author: "rex", urlToImage: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_766206_17017494326985532.jpg"))    
    ]
  }
}
