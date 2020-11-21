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
        let lastEpisodeToAir : TVDetailLastEpisodeToAir?
        let name : String?
        let networks : [Network]?
//        let nextEpisodeToAir : AnyObject?
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
                case lastEpisodeToAir = "last_episode_to_air"
                case name = "name"
                case networks = "networks"
//                case nextEpisodeToAir = "next_episode_to_air"
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
                lastEpisodeToAir = try TVDetailLastEpisodeToAir(from: decoder)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                networks = try values.decodeIfPresent([Network].self, forKey: .networks)
//                nextEpisodeToAir = try values.decodeIfPresent(AnyObject.self, forKey: .nextEpisodeToAir)
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
//        let logoPath : AnyObject?
        let name : String?
        let originCountry : String?

        enum CodingKeys: String, CodingKey {
                case id = "id"
//                case logoPath = "logo_path"
                case name = "name"
                case originCountry = "origin_country"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
//                logoPath = try values.decodeIfPresent(AnyObject.self, forKey: .logoPath)
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
//        let profilePath : AnyObject?

        enum CodingKeys: String, CodingKey {
                case creditId = "credit_id"
                case gender = "gender"
                case id = "id"
                case name = "name"
//                case profilePath = "profile_path"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
                gender = try values.decodeIfPresent(Int.self, forKey: .gender)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
//                profilePath = try values.decodeIfPresent(AnyObject.self, forKey: .profilePath)
        }

}


//
//struct TVDetailModel: Decodable {
//    let backdropPath: TVJSONNull?
//    let createdBy: [TVCreatedBy]
//    let episodeRunTime: [Int]
//    let firstAirDate: TVJSONNull?
//    let genres: [TVGenre]
//    let homepage: String
//    let id: Int
//    let inProduction: Bool
//    let languages: [String]
//    let lastAirDate, lastEpisodeToAir: TVJSONNull?
//    let name: String
//    let nextEpisodeToAir: TVJSONNull?
//    let networks: [TVNetwork]
//    let numberOfEpisodes, numberOfSeasons: Int
//    let originCountry: [String]
//    let originalLanguage, originalName, overview: String
//    let popularity: Double
//    let posterPath: TVJSONNull?
//    let productionCompanies: [TVJSONAny]
//    let productionCountries: [TVProductionCountry]
//    let seasons: [TVJSONAny]
//    let spokenLanguages: [TVSpokenLanguage]
//    let status, tagline, type: String
//    let voteAverage: Double
//    let voteCount: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case backdropPath = "backdrop_path"
//        case createdBy = "created_by"
//        case episodeRunTime = "episode_run_time"
//        case firstAirDate = "first_air_date"
//        case genres, homepage, id
//        case inProduction = "in_production"
//        case languages
//        case lastAirDate = "last_air_date"
//        case lastEpisodeToAir = "last_episode_to_air"
//        case name
//        case nextEpisodeToAir = "next_episode_to_air"
//        case networks
//        case numberOfEpisodes = "number_of_episodes"
//        case numberOfSeasons = "number_of_seasons"
//        case originCountry = "origin_country"
//        case originalLanguage = "original_language"
//        case originalName = "original_name"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case seasons
//        case spokenLanguages = "spoken_languages"
//        case status, tagline, type
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//struct TVCreatedBy: Decodable {
//    let id: Int
//    let creditID, name: String
//    let profilePath: TVJSONNull?
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case creditID = "credit_id"
//        case name
//        case profilePath = "profile_path"
//    }
//}
//
//struct TVGenre: Decodable {
//    let id: Int
//    let name: String
//}
//
//struct TVNetwork: Decodable {
//    let name: String
//    let id: Int
//    let logoPath, originCountry: String
//
//    private enum CodingKeys: String, CodingKey {
//        case name, id
//        case logoPath = "logo_path"
//        case originCountry = "origin_country"
//    }
//}
//
//struct TVProductionCountry: Decodable {
//    let iso3166_1, name: String
//
//    private enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}
//
//// MARK: - SpokenLanguage
//struct TVSpokenLanguage: Decodable {
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
//
//class TVJSONNull: Decodable, Hashable {
//
//    public static func == (lhs: TVJSONNull, rhs: TVJSONNull) -> Bool {
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
//            throw DecodingError.typeMismatch(TVJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class TVJSONAny: Decodable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(TVJSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return TVJSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return TVJSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return TVJSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is TVJSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is TVJSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is TVJSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try TVJSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try TVJSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try TVJSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try TVJSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try TVJSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try TVJSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
