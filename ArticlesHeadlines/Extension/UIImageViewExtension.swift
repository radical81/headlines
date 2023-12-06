//
//  UIImageViewExtension.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation
import UIKit

/// Convenience methods and properties for building images in the view.
extension UIImageView {
  /// Load image view from URL using asynchronous await.
  func loadFromUrl(_ urlString: String) async throws {
    guard let url = URL(string: urlString) else {
      return
    }
    let request = URLRequest(url: url)
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let image = UIImage(data: data)
      self.image = image
    } catch {
      self.image = noPhoto
      throw ImageError.fetchFailed("Could not fetch image.")
    }
  }
    
  /// Default image when an image cannot be generated.
  private var noPhoto: UIImage? {
    UIImage(systemName: "photo")
  }  
}

//TODO: Move
enum ImageError: Error {
  /// Image fetch failed.
  case fetchFailed(String)
  
  /// Retrieve the error messages
  var message: String {
    switch self {
    case .fetchFailed(let message):
      return message
    }
  }
}
