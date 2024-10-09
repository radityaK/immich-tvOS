//
//  User.swift
//  Immich
//
//  Created by Raditya Kurnianto on 08/10/24.
//

import Foundation
import SwiftyJSON
import Realm
import RealmSwift

class User: JSONConvertible {
    var accessToken: String
    var isAdmin: String
    var name: String
    var profileImagePath: String
    var shouldChangePassword = false
    var userEmail: String
    var userId: String
    
    required init?(json: JSON) {
        self.accessToken = json["accessToken"].stringValue
        self.isAdmin = json["isAdmin"].stringValue
        self.name = json["name"].stringValue
        self.profileImagePath = json["profileImagePath"].stringValue
        self.shouldChangePassword = json["shouldChangePassword"].boolValue
        self.userEmail = json["userEmail"].stringValue
        self.userId = json["userId"].stringValue
    }
    
    func toDataObject() {
        let realm = try! Realm()
        let user = UserData()
        user.accessToken = self.accessToken
        user.isAdmin = self.isAdmin
        user.name = self.name
        user.profileImagePath = self.profileImagePath
        user.shouldChangePassword = self.shouldChangePassword
        user.userEmail = self.userEmail
        user.userId = self.userId
        user.server = UserDefaults.standard.string(forKey: "immich_base_url")!
        
        try! realm.write {
            realm.add(user)
        }
        UserDefaults.standard.set(nil, forKey: "immich_base_url")
    }
}
