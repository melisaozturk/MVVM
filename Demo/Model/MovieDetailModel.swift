//
//  MovieDetailModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation


struct MovieDetailModel: Decodable {
    let adult : Bool?
    let backdropPath : String?
//    let belongsToCollection : AnyObject?
    let budget : Int?
    let genres : [Genre]?
    let homepage : String?
    let id : Int?
    let imdbId : String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let productionCompanies : [ProductionCompany]?
    let productionCountries : [ProductionCountry]?
    let releaseDate : String?
    let revenue : Int?
    let runtime : Int?
    let spokenLanguages : [SpokenLanguage]?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let voteAverage : Float?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath) 
//        belongsToCollection = try values.decodeIfPresent(AnyObject.self, forKey: .belongsToCollection)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        genres = try values.decodeIfPresent([Genre].self, forKey: .genres)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        productionCompanies = try values.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try values.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        spokenLanguages = try values.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try values.decodeIfPresent(Float.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}

struct SpokenLanguage : Decodable {

        let englishName : String?
        let iso6391 : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case englishName = "english_name"
                case iso6391 = "iso_639_1"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                englishName = try values.decodeIfPresent(String.self, forKey: .englishName)
                iso6391 = try values.decodeIfPresent(String.self, forKey: .iso6391)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }
}

struct ProductionCompany : Decodable {

        let id : Int?
        let logoPath : String?
        let name : String?
        let originCountry : String?

        enum CodingKeys: String, CodingKey {
                case id = "id"
                case logoPath = "logo_path"
                case name = "name"
                case originCountry = "origin_country"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                logoPath = try values.decodeIfPresent(String.self, forKey: .logoPath)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                originCountry = try values.decodeIfPresent(String.self, forKey: .originCountry)
        }

}

struct ProductionCountry : Decodable {

        let iso31661 : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case iso31661 = "iso_3166_1"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                iso31661 = try values.decodeIfPresent(String.self, forKey: .iso31661)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}

struct Genre : Decodable {

        let id : Int?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case id = "id"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}

//struct MovieDetailModel: Decodable {
//    let adult: Bool
//    let backdropPath: String
////    let belongsToCollection: MovieJSONNull?
//    let budget: Int
////    let genres: [MovieGenre]
//    let homepage: String
//    let id: Int
////    let imdbID,
//    let originalLanguage, originalTitle, overview: String
//    let popularity: Double
//    let posterPath: String
//    let productionCompanies: [MovieProductionCompany]
//    let productionCountries: [MovieProductionCountry]
//    let releaseDate: String
//    let revenue, runtime: Int
//    let spokenLanguages: [MovieSpokenLanguage]
//    let status, tagline, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
////        case belongsToCollection = "belongs_to_collection"
//        case budget, homepage, id//genres
////        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case releaseDate = "release_date"
//        case revenue, runtime
//        case spokenLanguages = "spoken_languages"
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//// MARK: - Genre
//struct MovieGenre: Decodable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - ProductionCompany
//struct MovieProductionCompany: Decodable {
//    let id: Int
//    let logoPath, name, originCountry: String
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case logoPath = "logo_path"
//        case name
//        case originCountry = "origin_country"
//    }
//}
//
//// MARK: - ProductionCountry
//struct MovieProductionCountry: Decodable {
//    let iso3166_1, name: String
//
//    private enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}
//
//// MARK: - SpokenLanguage
//struct MovieSpokenLanguage: Decodable {
//    let englishName, iso639_1, name: String
//
//    private enum CodingKeys: String, CodingKey {
//        case englishName = "english_name"
//        case iso639_1 = "iso_639_1"
//        case name
//    }
//}
//
//// MARK: - Encode/decode helpers
//class MovieJSONNull: Decodable, Hashable {
//
//    public static func == (lhs: MovieJSONNull, rhs: MovieJSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(MovieJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
