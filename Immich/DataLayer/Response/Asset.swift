//
//  Asset.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import SwiftyJSON

class Asset: JSONConvertible {
    var id, deviceAssetId, ownerId, deviceId, libraryId: String
    var type, originalPath, originalFileName, originalMIMEType: String
    var thumbhash, fileCreatedAt, fileModifiedAt, localDateTime: String
    var updatedAt, duration, livePhotoVideoId, checksum: String
    var assetUrl = ""
    var isFavorite, isArchived, isTrashed: Bool
    var isOffline, hasMetadata, resized: Bool
    var exifInfo: ExifInfo?
    
    required init?(json: JSON) {
        self.id = json["id"].stringValue
        self.deviceAssetId = json["deviceAssetId"].stringValue
        self.ownerId = json["ownerId"].stringValue
        self.deviceId = json["deviceId"].stringValue
        self.libraryId = json["libraryId"].stringValue
        self.type = json["type"].stringValue
        self.originalPath = json["originalPath"].stringValue
        self.originalFileName = json["originalFileName"].stringValue
        self.originalMIMEType = json["originalMIMEType"].stringValue
        self.thumbhash = json["thumbhash"].stringValue
        self.fileCreatedAt = json["fileCreatedAt"].stringValue
        self.fileModifiedAt = json["fileModifiedAt"].stringValue
        self.localDateTime = json["localDateTime"].stringValue
        self.updatedAt = json["updatedAt"].stringValue
        self.duration = json["duration"].stringValue
        self.livePhotoVideoId = json["livePhotoVideoId"].stringValue
        self.checksum = json["checksum"].stringValue
        self.isFavorite = json["isFavorite"].boolValue
        self.isArchived = json["isArchived"].boolValue
        self.isTrashed = json["isTrashed"].boolValue
        self.isOffline = json["isOffline"].boolValue
        self.hasMetadata = json["hasMetadata"].boolValue
        self.resized = json["resized"].boolValue
        
        if let baseUrl = UserDefaults.standard.string(forKey: "immich_base_url") {
            self.assetUrl = "\(baseUrl)/assets/\(self.id)/thumbnail"
        }
        
        self.exifInfo = ExifInfo(json: json["exifInfo"])
    }
}

class ExifInfo: JSONConvertible {
    var make, model: String
    var exifImageWidth, exifImageHeight, fileSizeInByte: Int
    var orientation, dateTimeOriginal: String
    var modifyDate: String
    var timeZone, lensModel: String
    var fNumber, focalLength: Double
    var iso: Int
    var exposureTime: String
    var latitude, longitude: Double
    var city, state, country, description: String
    
    required init?(json: JSON) {
        self.make = json["make"].stringValue
        self.model = json["model"].stringValue
        self.exifImageWidth = json["exifImageWidth"].intValue
        self.exifImageHeight = json["exifImageHeight"].intValue
        self.fileSizeInByte = json["fileSizeInByte"].intValue
        self.orientation = json["orientation"].stringValue
        self.dateTimeOriginal = json["dateTimeOriginal"].stringValue
        self.modifyDate = json["modifyDate"].stringValue
        self.timeZone = json["timeZone"].stringValue
        self.lensModel = json["lensModel"].stringValue
        self.fNumber = json["fNumber"].doubleValue
        self.focalLength = json["focalLength"].doubleValue
        self.iso = json["iso"].intValue
        self.exposureTime = json["exposureTime"].stringValue
        self.latitude = json["latitude"].doubleValue
        self.longitude = json["longitude"].doubleValue
        self.city = json["city"].stringValue
        self.state = json["state"].stringValue
        self.country = json["country"].stringValue
        self.description = json["description"].stringValue
    }
}
