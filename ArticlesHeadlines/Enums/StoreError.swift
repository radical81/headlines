//
//  StoreError.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

/// Catches errors when handling storage.
enum StoreError: ErrorWithMessage {
  /// Save error
  case saveFailed(String)
  
  var message: String {
    switch self {
    case .saveFailed(let message):
      return message
    }
  }
}
