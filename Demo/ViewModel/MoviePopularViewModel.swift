//
//  MoviePopularViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class MoviePopularViewModel: ApiClient {
            
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
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
    
    private func getFeed(from endpointType: Endpoint, completion: @escaping (Result<MoviePopularModel?, APIError>) -> Void) {
        
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
}
