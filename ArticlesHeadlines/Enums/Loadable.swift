//
//  Loadable.swift
//  ArticlesHeadlines
//
//

import Foundation

/// Loadable tracks the state a request is in when it is sent from the app to the API.
enum Loadable<T> {
  case notLoaded
  case loading
  case loaded(T)
  case failed(Error)
  
  /// The value of the loaded data
  var value: T? {
    switch self {
    case .loaded(let t):
      return t
    default:
      return nil
    }
  }
}

extension Loadable: Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    switch(lhs, rhs) {
    case(.notLoaded, .notLoaded):
      return true
    case(.loading, .loading):
      return true
    case(.loaded(_), .loaded(_)):
      return true
    case(.failed(_), .failed(_)):
      return true
    default:
      return false
    }
  }
}
