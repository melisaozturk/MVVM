//
//  TVDetailViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation
//
//class TVDetailViewModel: ApiClient {
//    
//    internal let session: URLSession
//    
//    init(configuration: URLSessionConfiguration) {
//        self.session = URLSession(configuration: configuration)
//    }
//    
//    convenience init() {
//        self.init(configuration: .default)
//    }
//    
//    internal func getMovieDetailData(completion: @escaping (MovieDetailModel) -> Void, completionHandler: @escaping (String) -> Void) {
//        getFeedTVDetail(from: .tv_detail, completion: { response in
//            switch response {
//            case .success(let successResponse):
//                guard let results = successResponse.self else {return}
//                completion(results)
//            case .failure(_):
//                #if DEBUG
//                print("Data Fetch Failed")
//                #endif
//                completionHandler("Error")
//            }
//        })
//    }
//    
//    private func getFeedTVDetail(from endpointType: Endpoint, completion: @escaping (Result<MovieDetailModel?, APIError>) -> Void) {
//        
//        let endpoint = endpointType
//        let request = endpoint.request
//        #if DEBUG
//        print(request)
//        #endif
//        
//        fetch(with: request, decode: { json -> MovieDetailModel? in
//            guard let feedResult = json as? MovieDetailModel else { return  nil }
//            return feedResult
//        }, completion: completion)
//    }
//    
//    internal func getMovieCreditsData(completion: @escaping (TVCreditsModel) -> Void, completionHandler: @escaping (String) -> Void) {
//        getFeedTVCredits(from: .tv_credits, completion: { response in
//            switch response {
//            case .success(let successResponse):
//                guard let results = successResponse.self else {return}
//                completion(results)
//            case .failure(_):
//                #if DEBUG
//                print("Data Fetch Failed")
//                #endif
//                completionHandler("Error")
//            }
//        })
//    }
//    
//    private func getFeedTVCredits(from endpointType: Endpoint, completion: @escaping (Result<TVCreditsModel?, APIError>) -> Void) {
//        
//        let endpoint = endpointType
//        let request = endpoint.request
//        #if DEBUG
//        print(request)
//        #endif
//        
//        fetch(with: request, decode: { json -> TVCreditsModel? in
//            guard let feedResult = json as? TVCreditsModel else { return  nil }
//            return feedResult
//        }, completion: completion)
//    }
//}
