//
//  MovieNowPlayingModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

struct MovieNowPlayingModel: Decodable {
    let results: [NowPlayingResult]
    let page, totalResults: Int
    let dates: NowPlayingDates
    let totalPages: Int

    private enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
}

struct NowPlayingDates: Decodable {
    let maximum, minimum: String
}

struct NowPlayingResult: Decodable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String
//    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    private enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
//        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case fr = "fr"
//    case ja = "ja"
//    case ko = "ko"
//}
//
