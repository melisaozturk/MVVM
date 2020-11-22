//
//  MovieTopRatedViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class MovieViewModel: ApiClient {
    
    let session: URLSession
    var topRatedModel: MovieTopRatedModel!
    var nowPlayingModel: MovieNowPlayingModel!
    var popularModel: MoviePopularModel!
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getTopRatedData(completion: @escaping (MovieTopRatedModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.movie_topRated
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieTopRatedModel? in
            guard let feedResult = json as? MovieTopRatedModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let successResponse):
                self.topRatedModel = successResponse
                completion(successResponse)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    func getPopularData(completion: @escaping (MoviePopularModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.movie_popular
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MoviePopularModel? in
            guard let feedResult = json as? MoviePopularModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let successResponse):
                self.popularModel = successResponse
                completion(successResponse)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
        
    }
    
    func getNowPlayingData(completion: @escaping (MovieNowPlayingModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.movie_nowPlaying
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieNowPlayingModel? in
            guard let feedResult = json as? MovieNowPlayingModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let successResponse):
                self.nowPlayingModel = successResponse
                completion(successResponse)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
}
