//
//  TVTopRatedModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

struct TVTopRatedModel: Decodable {
    let page, totalResults, totalPages: Int
    let results: [TVTopRatedResult]?
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct TVTopRatedResult: Decodable {
    let originalName: String
    let genreIDS: [Int]
    let name: String
    let popularity: Double
    let voteCount: Int
    let firstAirDate: String
    let backdropPath: String?
    let id: Int
    let voteAverage: Double
    let overview, posterPath: String
    
    private enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case genreIDS = "genre_ids"
        case name, popularity
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case id
        case voteAverage = "vote_average"
        case overview
        case posterPath = "poster_path"
    }
}

