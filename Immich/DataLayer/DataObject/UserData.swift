//
//  UserData.swift
//  Immich
//
//  Created by Raditya Kurnianto on 08/10/24.
//

import Realm
import RealmSwift

class UserData: Object {
    @Persisted var accessToken: String
    @Persisted var isAdmin: String
    @Persisted var name: String
    @Persisted var profileImagePath: String
    @Persisted var shouldChangePassword: Bool
    @Persisted var userEmail: String
    @Persisted var userId: String
    @Persisted var server: String
    
    class func getActiveUser() -> UserData? {
        let realm = try! Realm()
        return realm.objects(UserData.self).first
    }
}
