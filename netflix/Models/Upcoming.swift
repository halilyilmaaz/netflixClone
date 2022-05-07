//
//  Upcoming.swift
//  netflix
//
//  Created by halil yılmaz on 3.05.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendingUpcoming = try? newJSONDecoder().decode(TrendingUpcoming.self, from: jsonData)

import Foundation

// MARK: - TrendingUpcoming
struct TrendingUpcoming: Codable {
    let dates: Dates
    let page: Int
    let results: [Upcoming]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct Upcoming: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguageS
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}

enum OriginalLanguageS: String, Codable {
    case en = "en"
    case fr = "fr"
    case ja = "ja"
    case th = "th"
}
