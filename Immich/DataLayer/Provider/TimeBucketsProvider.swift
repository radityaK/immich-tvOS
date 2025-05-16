//
//  TimeBucketsProvider.swift
//  Immich
//
//  Created by Raditya Kurnianto on 5/16/25.
//

import Foundation

struct TimeBucketsProvider: ParamConvertible {
    var parameters: [String : Any] {
        return [
            "size": "MONTH",
            "order": "desc"
        ]
    }
}

struct SpecificTimeBucket: ParamConvertible {
    var size: String
    var timeBucket: String
    
    var parameters: [String : Any] {
        return Converter.toParameters(param: self)
    }
}
