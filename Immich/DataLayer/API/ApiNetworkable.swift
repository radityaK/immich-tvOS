//
//  ApiNetworkable.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import Foundation
import Moya
import Alamofire

/**
 Protocol that list function to call network request and its provider.
 */
protocol ApiNetworkable {
    var provider: MoyaProvider<Router> { get }
    
    @discardableResult
    func request<T: JSONConvertible>(endpoint: Router, completion: @escaping(ApiResponse<T>)-> Void) -> Cancellable
}
