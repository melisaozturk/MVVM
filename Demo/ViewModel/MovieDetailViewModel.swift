//
//  MovieDetailViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class MovieDetailViewModel: ApiClient {
    
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getMovieDetailData(completion: @escaping (MovieDetailModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeedMovieDetail(from: .movie_detail, completion: { response in
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
 
    internal func getMovieCreditsData(completion: @escaping (MovieCreditsModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeedMovieCredits(from: .movie_credits, completion: { response in
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
