//
//  ErrorWithMessage.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation
/// Errors with messages
protocol ErrorWithMessage: Error {
  /// Retrieve the error message.
  var message: String { get }
}
