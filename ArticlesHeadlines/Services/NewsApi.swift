//
//  NewsApi.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 8/12/2023.
//

import Foundation

/// Implements the NewsRetriever protocol with the News API as the data source.
struct NewsApi: NewsRetriever {
  
  /// The API key.
  var apiKey: String {
    "bb911c2fd54f4efd829d0931cafbc333"
  }
    
  /// News API base URL.
  var baseUrl: String {
    "https://newsapi.org/v2"
  }
  
  /// Fetches the headlines.
  func fetchHeadlines(_ sources: [Source]) async -> Loadable<[Headline]> {
    guard var components = URLComponents(string: baseUrl + "/top-headlines") else {
      return .failed(APIError.malformed("Invalid URL."))
    }

    let sources = Shared.storage.newsSources.filter{ $0.selected == true }.map{ $0.id }.joined(separator: ",")
    components.queryItems = [
        URLQueryItem(name: "apiKey", value: apiKey)
    ]
    if !sources.isEmpty {
      components.queryItems?.append(URLQueryItem(name: "sources", value: sources))
    } else {
      components.queryItems?.append(URLQueryItem(name: "country", value: "au"))
    }

    guard let url = components.url else {
      return .failed(APIError.malformed("Invalid URL."))
    }
    
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let decoder = JSONDecoder()
    var dataResponse: (Data, URLResponse)?
    do {
      dataResponse = try await URLSession.shared.data(for: request)
    } catch {
      return .failed(APIError.network("Network error or invalid endpoint."))
    }
    guard let response = dataResponse?.1 as? HTTPURLResponse else {
      return .failed(APIError.network("No response from the API."))
    }
    guard let data = dataResponse?.0 else {
      return .failed(APIError.network("Missing data from the API."))
    }
    if response.statusCode == 400 { // Bad request
      return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
    }
    guard response.statusCode == 200,
          let response = try? decoder.decode(Response.self, from: data)
    else {
      return .failed(APIError.unknown)
    }
    return .loaded(response.articles ?? [])
  }
  
  /// Retrieve news sources.
  func fetchSources() async -> Loadable<[Source]> {
    guard var components = URLComponents(string: baseUrl + "/top-headlines/sources") else {
      return .failed(APIError.malformed("Invalid URL."))
    }
    
    components.queryItems = [
        URLQueryItem(name: "country", value: "au"),
        URLQueryItem(name: "language", value: "en"),
        URLQueryItem(name: "apiKey", value: apiKey)
    ]

    guard let url = components.url else {
      return .failed(APIError.malformed("Invalid URL."))
    }
    
    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let decoder = JSONDecoder()
    var dataResponse: (Data, URLResponse)?
    do {
      dataResponse = try await URLSession.shared.data(for: request)
    } catch {
      return .failed(APIError.network("Network error or invalid endpoint."))
    }
    guard let response = dataResponse?.1 as? HTTPURLResponse else {
      return .failed(APIError.network("No response from the API."))
    }
    guard let data = dataResponse?.0 else {
      return .failed(APIError.network("Missing data from the API."))
    }
    if response.statusCode == 400 { // Bad request
      return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
    }
    guard response.statusCode == 200,
          let response = try? decoder.decode(Response.self, from: data)
    else {
      return .failed(APIError.unknown)
    }
    return .loaded(response.sources ?? [])
  }
}
