//
//  TVTopRatedViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class TVViewModel: ApiClient {
            
    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getTVTopRatedData(completion: @escaping (TVTopRatedModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeed(from: .tv_topRated, completion: { response in
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
    
    private func getFeedTopRated(from endpointType: Endpoint, completion: @escaping (Result<TVTopRatedModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVTopRatedModel? in
            guard let feedResult = json as? TVTopRatedModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
    
    internal func getTVTPopularData(completion: @escaping (TVPopularModel) -> Void, completionHandler: @escaping (String) -> Void) {
        getFeed(from: .tv_popular, completion: { response in
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
    
    private func getFeedPopular(from endpointType: Endpoint, completion: @escaping (Result<TVPopularModel?, APIError>) -> Void) {
        
        let endpoint = endpointType
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVPopularModel? in
            guard let feedResult = json as? TVPopularModel else { return  nil }
            return feedResult
        }, completion: completion)
    }
}
