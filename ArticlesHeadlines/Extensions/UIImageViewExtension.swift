//
//  UIImageViewExtension.swift
//  ArticlesHeadlines
//

import Foundation
import UIKit

/// Convenience methods and properties for building images in the view.
extension UIImageView {
  /// Load image view from URL  using async await.
  func loadFromUrl(_ url: URL) async throws {
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
