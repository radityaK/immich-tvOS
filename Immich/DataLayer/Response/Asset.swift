//
//  Asset.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import SwiftyJSON

class Asset: JSONConvertible {
    var id: String
    var deviceAssetId: String
    var ownerId: String
    var deviceId: String
    var libraryId: String
    var type: String
    
    required init?(json: JSON) {
        self.id = json["id"].stringValue
        self.deviceAssetId = json["deviceAssetId"].stringValue
        self.ownerId = json["ownerId"].stringValue
        self.deviceId = json["deviceId"].stringValue
        self.libraryId = json["libraryId"].stringValue
        self.type = json["type"].stringValue
    }
}
