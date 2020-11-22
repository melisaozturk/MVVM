//
//  TVDetailModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

struct TVDetailModel: Decodable {
    let backdropPath : String?
    let createdBy : [CreatedBy]?
    let episodeRunTime : [Int]?
    let firstAirDate : String?
    let genres : [TVDetailGenre]?
    let homepage : String?
    let id : Int?
    let inProduction : Bool?
    let languages : [String]?
    let lastAirDate : String?
    let name : String?
    let networks : [Network]?
    let numberOfEpisodes : Int?
    let numberOfSeasons : Int?
    let originCountry : [String]?
    let originalLanguage : String?
    let originalName : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let productionCompanies : [ProductionCompany]?
    let productionCountries : [ProductionCountry]?
    let seasons : [Season]?
    let spokenLanguages : [SpokenLanguage]?
    let status : String?
    let tagline : String?
    let type : String?
    let voteAverage : Float?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case name = "name"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        createdBy = try values.decodeIfPresent([CreatedBy].self, forKey: .createdBy)
        episodeRunTime = try values.decodeIfPresent([Int].self, forKey: .episodeRunTime)
        firstAirDate = try values.decodeIfPresent(String.self, forKey: .firstAirDate)
        genres = try values.decodeIfPresent([TVDetailGenre].self, forKey: .genres)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        inProduction = try values.decodeIfPresent(Bool.self, forKey: .inProduction)
        languages = try values.decodeIfPresent([String].self, forKey: .languages)
        lastAirDate = try values.decodeIfPresent(String.self, forKey: .lastAirDate)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        networks = try values.decodeIfPresent([Network].self, forKey: .networks)
        numberOfEpisodes = try values.decodeIfPresent(Int.self, forKey: .numberOfEpisodes)
        numberOfSeasons = try values.decodeIfPresent(Int.self, forKey: .numberOfSeasons)
        originCountry = try values.decodeIfPresent([String].self, forKey: .originCountry)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        productionCompanies = try values.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try values.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries)
        seasons = try values.decodeIfPresent([Season].self, forKey: .seasons)
        spokenLanguages = try values.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        voteAverage = try values.decodeIfPresent(Float.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
}

struct TVDetailSpokenLanguage: Decodable {
    
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

struct Season: Decodable {
    
    let airDate : String?
    let episodeCount : Int?
    let id : Int?
    let name : String?
    let overview : String?
    let posterPath : String?
    let seasonNumber : Int?
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airDate = try values.decodeIfPresent(String.self, forKey: .airDate)
        episodeCount = try values.decodeIfPresent(Int.self, forKey: .episodeCount)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        seasonNumber = try values.decodeIfPresent(Int.self, forKey: .seasonNumber)
    }
    
}

struct TVDetailProductionCountry: Decodable {
    
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

struct TVDetailProductionCompany: Decodable {
    
    let id : Int?
    let name : String?
    let originCountry : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        originCountry = try values.decodeIfPresent(String.self, forKey: .originCountry)
    }
    
}

struct Network: Decodable {
    
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

struct TVDetailLastEpisodeToAir: Decodable {
    
    let airDate : String?
    let episodeNumber : Int?
    let id : Int?
    let name : String?
    let overview : String?
    let productionCode : String?
    let seasonNumber : Int?
    let stillPath : String?
    let voteAverage : Int?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airDate = try values.decodeIfPresent(String.self, forKey: .airDate)
        episodeNumber = try values.decodeIfPresent(Int.self, forKey: .episodeNumber)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        productionCode = try values.decodeIfPresent(String.self, forKey: .productionCode)
        seasonNumber = try values.decodeIfPresent(Int.self, forKey: .seasonNumber)
        stillPath = try values.decodeIfPresent(String.self, forKey: .stillPath)
        voteAverage = try values.decodeIfPresent(Int.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
}

struct TVDetailGenre: Decodable {
    
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

struct CreatedBy: Decodable {
    
    let creditId : String?
    let gender : Int?
    let id : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case creditId = "credit_id"
        case gender = "gender"
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
