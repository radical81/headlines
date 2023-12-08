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
    "https://newsapi.org"
  }
  
  /// Fetches the headlines.
  func fetchHeadlines(_ sources: [Source]) async -> Loadable<[Headline]> {
//    guard var components = URLComponents(string: baseUrl) else {
//      return .failed(APIError.malformed("Invalid URL."))
//    }
//
//    let sources = LocalStore().newsSources.map{ $0.id }.joined(separator: ",")
//    components.queryItems = [
//        URLQueryItem(name: "sources", value: sources),
//        URLQueryItem(name: "")
//    ]
//
//    guard let url = components.url else {
//        throw URLError(.badURL)
//    }
//    
//    guard let url = URL(String: baseUrl) else {
//      return .failed(APIError.malformed("Invalid URL."))
//    }
//    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//    request.httpMethod = "GET"
//    var encodedData: Data?
//    do {
//      encodedData = try JSONEncoder().encode(person)
//    } catch {
//      return .failed(APIError.missingRequestDetails("Name or email must be missing in the request payload."))
//    }
//    guard let encodedData = encodedData else {
//      return .failed(APIError.missingRequestDetails("Name or email must be missing in the request payload."))
//    }
//    request.httpBody = encodedData
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    let decoder = JSONDecoder()
//    var dataResponse: (Data, URLResponse)?
//    do {
//      dataResponse = try await URLSession.shared.data(for: request)
//    } catch {
//      return .failed(APIError.network("Network error or invalid endpoint."))
//    }
//    guard let response = dataResponse?.1 as? HTTPURLResponse else {
//      return .failed(APIError.network("No response from the API."))
//    }
//    guard let data = dataResponse?.0 else {
//      return .failed(APIError.network("Missing data from the API."))
//    }
//    if response.statusCode == 400 { // Bad request
//      guard let responseDetails = try? decoder.decode(Response.self, from: data), let errorMessage = responseDetails.errorMessage else {
//        return .failed(APIError.badRequest("Bad request, the service cannot handle this."))
//      }
//      return .failed(APIError.badRequest(errorMessage))
//    }
//    guard response.statusCode == 200, let stringResponse = String(data: data, encoding: .utf8), stringResponse == "Registered" else {
//      return .failed(APIError.registrationFail)
//    }
//    return .loaded(Response(registered: true))
    
    
    return .notLoaded
    
  }
  
  /// Retrieve news sources.
  func fetchSources() async -> Loadable<[Source]> {
    return .notLoaded
  }
}
