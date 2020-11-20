//
//  Endpoints.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

enum Endpoint {
    case movie_topRated
    case movie_nowPlaying
    case movie_popular
    case tv_topRated
    case tv_popular
//    case movie_detail
//    case tv_detail
//    case movie_credits
//    case tv_credits
}

extension Endpoint: BaseEndpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .movie_topRated: return "/3/movie/top_rated"
        case .movie_nowPlaying: return "/3/movie/now_playing"
        case .movie_popular: return "/3/movie/popular"
        case .tv_topRated: return "/3/tv/top_rated"
        case .tv_popular: return "/3/tv/popular"
//        case .movie_detail: return "/3/movie/\(movie_id)"
//        case .tv_detail: return "/3/tv/\(tv_id)"
//        case .movie_credits: return "/3/movie/\(movie_id)/credits"
//        case .tv_credits: return "/3/movie/\(tv_id)/credits"
        }
    }

    var query: [URLQueryItem] {
        switch self {
        case .movie_topRated, .movie_nowPlaying, .movie_popular, .tv_topRated, .tv_popular:
            return [URLQueryItem(name: "api_key", value:"45a4fdf097060d7804046ad3fe9098c3"), URLQueryItem(name: "language", value:"en-US"), URLQueryItem(name: "page", value: "1")]
//        case .movie_detail, .tv_detail, .movie_credits, .tv_credits:
//            return[URLQueryItem(name: "api_key", value:"45a4fdf097060d7804046ad3fe9098c3"), URLQueryItem(name: "language", value:"en-US")]
        }
    }
}
