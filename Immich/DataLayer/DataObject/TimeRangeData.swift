//
//  TimeRangeData.swift
//  Immich
//
//  Created by Raditya Kurnianto on 5/16/25.
//

import Realm
import RealmSwift

class TimeRangeData: Object {
    @Persisted var timeBucket: String
    @Persisted var count: Int
    
    class func getAllTimeRangeData() -> Results<TimeRangeData> {
        let realm = try! Realm()
        return realm.objects(TimeRangeData.self)
    }
}
