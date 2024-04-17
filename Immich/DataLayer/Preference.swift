//
//  Preference.swift
//  CNBC
//
//  Created by Raditya Kurnianto on 7/23/20.
//  Copyright © 2020 detik. All rights reserved.
//

import Foundation

struct Preference {
    
    static var baseUrl : String {
        get{
            return UserDefaults.standard.string(forKey: "immich_base_url") ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue,forKey: "immich_base_url")
        }
    }
}
