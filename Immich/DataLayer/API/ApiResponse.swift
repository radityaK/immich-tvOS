//
//  ApiResponse.swift
//  CNBC
//
//  Created by Raditya Kurnianto on 6/4/20.
//  Copyright © 2020 detik. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

/**
 Base struct to receive every network request response which conform to JSONConvertible struct.
 */
struct ApiResponse<T> where T: JSONConvertible {
    /**
     A variable for network response with generic type.
     */
    var data: T?
    
    /**
     A variable for network response with generic type as array.
     */
    var array: [T]? = Array()
    
    /**
     Error variable.
     */
    var error: Error?
    
    /**
     HTTP status code.
     */
    var statusCode = 0
    
    /**
     A variable to store metadata from network response.
     */
    var metadata: Metadata?
    
    init(result: Result<Response, MoyaError>) {
        switch result {
        case .success(let response):
            guard let url = response.request?.url else { return }
            self.statusCode = response.statusCode
            guard let jsonResponse = try? JSON(data: response.data) else { return }
            // Process Array
            jsonResponse.array?.forEach({ item in
                if let object = T(json: item) {
                    self.array?.append(object)
                }
            })
        case .failure(let error):
            self.error = error
        }
    }
}
