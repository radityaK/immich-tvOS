//
//  ParamConvertible.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import Foundation

/**
 Protocol to hold parameters for network request in a type of `Dictionary`.
 */
protocol ParamConvertible {
    var parameters: [String: Any] { get }
}

extension ParamConvertible {
    var cookies : HTTPCookie? { return nil }
}

/**
 Converter class to convert a struct or object to `Dictionary`.
 */
class Converter {
    static func toParameters(param: Any) -> [String: Any] {
        let mirror = Mirror(reflecting: param)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
          guard let label = label else { return nil }
          return (label, value)
        }).compactMap { $0 })
        return dict
    }
}
