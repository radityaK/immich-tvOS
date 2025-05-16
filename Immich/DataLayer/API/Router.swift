//
//  Router.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import Foundation

/**
 List of all available network request.
 */
enum Router {
    case allAsset(provider: ParamConvertible)
    case allAlbum(provider: ParamConvertible)
    case login(provider: ParamConvertible)
    case timeBuckets(provider: ParamConvertible)
}
