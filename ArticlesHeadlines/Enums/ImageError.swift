//
//  ImageError.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation

/// enum to track errors from loading images.
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
