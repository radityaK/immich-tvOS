//
//  Router+TargetType.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import Foundation
import Moya

/**
 Extension of Router which conform to Moya TargetType.
 */
extension Router: TargetType {
    /**
     Define base url for every network request.
     */

    var environmentUrl: String {
        switch self {
        default: return Environment.production.rawValue //RELEASECHECK
        //default: return Environment.development.rawValue
        }
    }
    
    /**
     Base url defined by `environementUrl`.
     */
    var baseURL: URL {
        guard let url = URL(string: environmentUrl) else { fatalError("Could not create environmentBaseUrl.") }
        return url
    }
    
    /**
     Path for every network url.
     */
    var path: String {
        switch self {
        case .allAsset: return "asset"
        }
    }
    
    /**
     HTTP method for each network request.
     */
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    /**
     Mandatory protocol of Moya TargetType. We can provide it Data() object.
     */
    var sampleData: Data {
        return Data()
    }
    
    /**
     Object of current network task.
     */
    var task: Task {
        switch self {
        default :
            return .requestParameters(parameters: param, encoding: encoding)
        }

    }
    
    /**
     Header for each network request.
     */
    var headers: [String : String]? {
        switch self {
        case .allAsset:
            return ["x-api-key": "JjlipfdvMPAy3DBNTFibqYwYLNStxMV1iklIbhX5E"]
        default:
            return ["User-Agent": userAgent, "Authorization":auth]
        }
    }
    
    /**
     User Agent for each network request.
     */
    var userAgent: String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return "" }
        let userAgent = "immich/iphone " + version
        return userAgent
    }
    
    /**
     Basic auth for each network request.
     */
    var auth: String {
        return "Basic \(Data("cnbcindonesia:cnbc1nd0n3s14".utf8).base64EncodedString())"
    }
    
    /**
     URLEncoding for each network request.
     */
    var encoding: ParameterEncoding {
        switch self {
        // encoding for HTTP Post Method
//        case .stockDetail, .login, .reportOpenPush, .registerPush: return URLEncoding.default
        // encoding for HTTP Delete Method with body param
//        case .unregisterPush,.getRekomendasiBoxBD,.getRekomendasiIndex,.getRekomendasiDetail:
//            return URLEncoding.httpBody
        // encoding for HTTP Get Method
        default: return URLEncoding.queryString
        }
    }
    
    /**
     Parameter for each network request.
     */
    var param: [String: Any] {
        switch self {
        case .allAsset(let provider):
            return provider.parameters
        }
    }
}
