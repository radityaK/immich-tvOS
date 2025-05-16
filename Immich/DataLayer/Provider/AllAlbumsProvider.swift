//
//  AllAlbumsProvider.swift
//  Immich
//
//  Created by Raditya Kurnianto on 5/16/25.
//

import Foundation

struct AllAlbumsProvider: ParamConvertible {
    var userId: String
    
    var parameters: [String : Any] {
        return Converter.toParameters(param: self)
    }
}
