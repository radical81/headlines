//
//  Response.swift
//  ArticlesHeadlines
//

import Foundation

/// Model to capture the responses from the API.
/// For the sake of this time-limited test, we will use the Headline model and assume it is identical with API's data.
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
