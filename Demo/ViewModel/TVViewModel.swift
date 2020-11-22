//
//  TVTopRatedViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class TVViewModel: ApiClient {
            
    internal let session: URLSession
    var tvTopRatedModel: TVTopRatedModel!
    var tvPopularModel: TVPopularModel!
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getTVTopRatedData(completion: @escaping (TVTopRatedModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.tv_topRated
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVTopRatedModel? in
            guard let feedResult = json as? TVTopRatedModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let successResponse):
                self.tvTopRatedModel = successResponse
                completion(successResponse)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    internal func getTVTPopularData(completion: @escaping (TVPopularModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.tv_popular
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVPopularModel? in
            guard let feedResult = json as? TVPopularModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let successResponse):
                self.tvPopularModel = successResponse
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
