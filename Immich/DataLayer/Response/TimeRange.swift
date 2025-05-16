//
//  TimeRange.swift
//  Immich
//
//  Created by Raditya Kurnianto on 5/16/25.
//

import Foundation
import SwiftyJSON
import Realm
import RealmSwift

class TimeRange: JSONConvertible {
    var timeBucket: String
    var count: Int
    
    required init?(json: SwiftyJSON.JSON) {
        self.timeBucket = json["timeBucket"].stringValue
        self.count = json["count"].intValue
    }
    
    func toDataObject() {
        let realm = try! Realm()
        let time = TimeRangeData()
        time.timeBucket = self.timeBucket
        time.count = self.count
        
        try! realm.write {
            realm.add(time)
        }
    }
}
