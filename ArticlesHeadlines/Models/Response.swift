//
//  Response.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Model to capture the responses from the API.
struct Response: Decodable {
  /// News articles
  var articles: [Headline]?
  var sources: [Source]?
  
  /// Use to decode from JSON.
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    articles = try values.decodeIfPresent([Headline].self, forKey: .articles)
    sources = try values.decodeIfPresent([Source].self, forKey: .sources)
  }
  
  enum CodingKeys: String, CodingKey {
    case articles, sources
  }
}
