//
//  UIAlertControllerExtension.swift
//  ArticlesHeadlines
//

import Foundation
import UIKit

extension UIAlertController {
  /// Generate confirmation dialog for delete operations.
  static func confirmDelete(action: @escaping () -> Void) -> UIAlertController {
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
  
  /// Generate error alert.
  static func errorAlert(title: String, message: String) -> UIAlertController {
    // Declare Alert message
    let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)    
    // Create OK button with action handler
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    dialogMessage.addAction(ok)
    return dialogMessage
  }
  
  /// Generate success alert.
  static func success(message: String) -> UIAlertController {
    // Declare Alert message
    let dialogMessage = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
    // Create OK button with action handler
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    dialogMessage.addAction(ok)
    return dialogMessage
  }
}
