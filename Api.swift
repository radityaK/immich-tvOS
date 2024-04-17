//
//  Api.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import Moya

/**
 Network manager that contain methods to access all available endpoint in `Router` enum.
 */
struct Api: ApiNetworkable {
    static let shared = Api()
    
    internal let provider = MoyaProvider<Router>(plugins: [NetworkLoggerPlugin()])
    
    @discardableResult
    func request<T>(endpoint: Router, completion: @escaping (ApiResponse<T>) -> Void) -> Cancellable where T : JSONConvertible {
        return request(target: endpoint, completion: completion)
    }
    
    fileprivate func request<T: JSONConvertible>(target: Router, completion: @escaping(ApiResponse<T>)-> Void) -> Cancellable {
        return provider.request(target) { (response) in
            completion(ApiResponse<T>(result: response))
        }
    }
}
