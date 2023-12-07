//
//  UIAlertControllerExtension.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 7/12/2023.
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
}
