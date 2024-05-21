//
//  StoreError.swift
//  ArticlesHeadlines
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
