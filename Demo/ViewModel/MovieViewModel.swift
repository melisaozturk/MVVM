//
//  MovieTopRatedViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class MovieViewModel: ApiClient {
    
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getTopRatedData(completion: @escaping (MovieTopRatedModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeed(from: .movie_topRated, completion: { response in
            switch response {
            case .success(let successResponse):
                guard let results = successResponse.self else {return}
                completion(results)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    private func getFeedTopRated(from endpointType: Endpoint, completion: @escaping (Result<MovieTopRatedModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieTopRatedModel? in
            guard let feedResult = json as? MovieTopRatedModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
    
    internal func getPopularData(completion: @escaping (MoviePopularModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeed(from: .movie_popular, completion: { response in
            switch response {
            case .success(let successResponse):
                guard let results = successResponse.self else {return}
                completion(results)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    private func getFeedPopular(from endpointType: Endpoint, completion: @escaping (Result<MoviePopularModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MoviePopularModel? in
            guard let feedResult = json as? MoviePopularModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
    
    internal func getNowPlayingData(completion: @escaping (MovieNowPlayingModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeed(from: .movie_nowPlaying, completion: { response in
            switch response {
            case .success(let successResponse):
                guard let results = successResponse.self else {return}
                completion(results)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    private func getFeedNowPlaying(from endpointType: Endpoint, completion: @escaping (Result<MovieNowPlayingModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieNowPlayingModel? in
            guard let feedResult = json as? MovieNowPlayingModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
}
