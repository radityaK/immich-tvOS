//
//  LoginProvider.swift
//  Immich
//
//  Created by Raditya Kurnianto on 08/10/24.
//

import Foundation

struct LoginProvider: ParamConvertible {
    var email: String
    var password: String
    var server: String
    
    var parameters: [String : Any] {
        return Converter.toParameters(param: self)
    }
}
