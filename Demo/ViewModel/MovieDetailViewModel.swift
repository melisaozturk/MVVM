//
//  MovieDetailViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class MovieDetailViewModel: ApiClient {
    
    internal let session: URLSession
    var movieDetailModel: MovieDetailModel!
    var movieCreditsModel: MovieCreditsModel!
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getMovieDetailData(id: Int, completion: @escaping (MovieDetailModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeedMovieDetail(from: .movie_detail(id), completion: { response in
            switch response {
            case .success(let successResponse):
                self.movieDetailModel = successResponse
                completion(successResponse!)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    private func getFeedMovieDetail(from endpointType: Endpoint, completion: @escaping (Result<MovieDetailModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieDetailModel? in
            guard let feedResult = json as? MovieDetailModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
 
    internal func getMovieCreditsData(id: Int, completion: @escaping (MovieCreditsModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeedMovieCredits(from: .movie_credits(id), completion: { response in
            switch response {
            case .success(let successResponse):
                self.movieCreditsModel = successResponse
                completion(successResponse!)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    private func getFeedMovieCredits(from endpointType: Endpoint, completion: @escaping (Result<MovieCreditsModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> MovieCreditsModel? in
            guard let feedResult = json as? MovieCreditsModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
    
}
