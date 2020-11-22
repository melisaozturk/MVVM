//
//  TVDetailViewModel.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import Foundation

class TVDetailViewModel: ApiClient {
    
    let session: URLSession
    var tvDetailModel: TVDetailModel!
    var tvCreditsModel: TVCreditsModel!
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    internal func getTVDetailData(id: Int, completion: @escaping (TVDetailModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.tv_detail(id)
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVDetailModel? in
            guard let feedResult = json as? TVDetailModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let successResponse):
                self.tvDetailModel = successResponse
                completion(successResponse)
            case .failure(_):
                #if DEBUG
                print("Data Fetch Failed")
                #endif
                completionHandler("Error")
            }
        })
    }
    
    internal func getTVCreditsData(id: Int, completion: @escaping (TVCreditsModel) -> Void, completionHandler: @escaping (String) -> Void) {
        
        let endpoint = Endpoint.tv_credits(id)
        let request = endpoint.request
        #if DEBUG
        print(request)
        #endif
        
        fetch(with: request, decode: { json -> TVCreditsModel? in
            guard let feedResult = json as? TVCreditsModel else { return  nil }
            return feedResult
        }, completion: { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let successResponse):
                self.tvCreditsModel = successResponse
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
