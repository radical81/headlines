//
//  Headline.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import Foundation

/// Represents the top headlines data returned from the News API.
struct Headline {
  var title: String
  var description: String
  var author: String
  var url: String
  var urlToImage: String
}
