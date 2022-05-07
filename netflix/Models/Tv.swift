

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendingTvResponse = try? newJSONDecoder().decode(TrendingTvResponse.self, from: jsonData)

import Foundation

// MARK: - TrendingTvResponse
struct TrendingTvResponse: Codable {
    let page: Int
    let results: [TV]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct TV: Codable {
    let name, overview: String
    let voteCount: Int
    let voteAverage: Double
    let backdropPath, posterPath: String
    let genreIDS: [Int]
    let originalLanguage: OriginalLanguages
    let originalName: String
    let originCountry: [String]
    let id: Int
    let firstAirDate: String
    let popularity: Double
    let mediaType: MediaTypes

    enum CodingKeys: String, CodingKey {
        case name, overview
        case voteCount
        case voteAverage
        case backdropPath
        case posterPath
        case genreIDS
        case originalLanguage
        case originalName
        case originCountry
        case id
        case firstAirDate
        case popularity
        case mediaType
    }
}

enum MediaTypes: String, Codable {
    case tv = "tv"
}

enum OriginalLanguages: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
}
