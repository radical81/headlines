//
//  ArticleViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController, WKUIDelegate {

  /// The data source
  var headline: HeadlineViewModel
  
  /// Save button enabling
  var showSaveButton: Bool = false
  
  /// Delete button enabling
  var showDeleteButton: Bool = false
  
  init(_ headline: HeadlineViewModel) {
    self.headline = headline
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
    let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteItem))
    self.navigationItem.rightBarButtonItems = []
    if showSaveButton {
      self.navigationItem.rightBarButtonItems?.append(saveButton)
    }
    if showDeleteButton {
      self.navigationItem.rightBarButtonItems?.append(deleteButton)
    }
  }
  
  override func loadView() {
    loadWebView(from: headline)
  }
  
  func loadWebView(from headline: HeadlineViewModel) {
    let webConfiguration = WKWebViewConfiguration()
    let webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
    guard let articleUrl = URL(string: headline.articleUrl) else {
      return
    }
    let request = URLRequest(url: articleUrl)
    DispatchQueue.main.async {
      webView.load(request)
    }
  }
  
  @objc func saveItem() {
    do {
      try Shared.storage.saveHeadline(headline.headline)
      self.present(UIAlertController.success(message: "The headline has been saved."), animated: true)
    } catch StoreError.saveFailed(let message) {
      self.present(UIAlertController.errorAlert(title: "Save Failed", message: message), animated: true)
    } catch {
      print("An error has occured.")
    }
  }
  
  @objc func deleteItem() {
    let confirmation = UIAlertController.confirmDelete {
      Shared.storage.deleteHeadline(self.headline.headline)
      self.navigationController?.popViewController(animated: true)
    }
    self.present(confirmation, animated: true)
  }
}
