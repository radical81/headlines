//
//  ImageError.swift
//  ArticlesHeadlines
//
//

import Foundation

/// enum to track errors from loading images.
enum ImageError: ErrorWithMessage {
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
