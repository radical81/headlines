import XCTest
@testable import ArticlesHeadlines

struct MockNews: NewsRetriever {
  let mockNews = """
  {
    "status": "ok",
    "totalResults": 40,
    "articles": [
      {
      "source": {
        "id": "australian-financial-review",
        "name": "Australian Financial Review"
      },
      "author": "Maxim Shanahan",
      "title": "Accenture set to buy Partners in Performance",
      "description": "Consulting firm Accenture is set to acquire Partners in Performance, in the most significant consulting market deal in nearly five years.",
      "url": "http://www.afr.com/companies/professional-services/accenture-set-to-buy-partners-in-performance-20240517-p5jegw",
      "urlToImage": "https://static.ffx.io/images/$zoom_0.5031%2C$multiply_2%2C$ratio_1.777778%2C$width_1059%2C$x_199%2C$y_151/t_crop_custom/c_scale%2Cw_800%2Cq_88%2Cf_jpg/t_afr_exclusive_no_age_social_wm/176db888e9c9cac4cd3fa6e260fca1fa87f5d3f4",
      "publishedAt": "2024-05-21T00:07:08Z",
      "content": "Consulting firm Accenture is set to acquire mid-sized operational consultancy Performance in Partners, in a buyout that is betting on increased demand for cost-out advisory amid an uncertain economic… [+273 chars]"
      },
      {
        "source": {
        "id": "australian-financial-review",
        "name": "Australian Financial Review"
      },
      "author": "James Thomson",
      "title": "ASX sharemarket: UBS strategist Richard Schellbach says Wall Street’s relentless grind higher will flow through to a mini melt-up, and picks 12 local stocks to watch",
      "description": "Local UBS strategist Richard Schellbach says Wall Street’s relentless grind higher will inevitably flow through to the ASX, and has picked some local stocks to watch.",
      "url": "http://www.afr.com/chanticleer/9-signs-there-s-a-mini-melt-up-on-the-asx-and-12-stocks-to-buy-20240521-p5jf8u",
      "urlToImage": "https://static.ffx.io/images/$zoom_0.6429%2C$multiply_2%2C$ratio_1.777778%2C$width_1059%2C$x_0%2C$y_0/t_crop_custom/c_scale%2Cw_800%2Cq_88%2Cf_jpg/t_afr_opinion_no_age_social_wm/a3930df785ea6753e7f2cee758600fedefe7f2d9",
      "publishedAt": "2024-05-20T23:36:11Z",
      "content": "Another day, another set of record highs on Wall Street and another bear throws in the towel.\r\nFor months, Morgan Stanley strategist Michael Wilson has been steadfast in his view that markets had bec… [+190 chars]"
      }
    ]
  }
  """
  var apiKey: String { "" }
  
  var baseUrl: String { "" }
  
  func fetchHeadlines(_ sources: [ArticlesHeadlines.Source]) async -> ArticlesHeadlines.Loadable<[ArticlesHeadlines.Headline]> {
    let decoder = JSONDecoder()
    let data = mockNews.data(using: .utf8)!
    let response = try? decoder.decode(Response.self, from: data)
    return .loaded(response?.articles ?? [])
  }
  
  func fetchSources() async -> ArticlesHeadlines.Loadable<[ArticlesHeadlines.Source]> {
    .notLoaded
  }
}
