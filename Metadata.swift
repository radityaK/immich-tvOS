//
//  Metadata.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import SwiftyJSON

struct Metadata: JSONConvertible, Pageable {
    var lastDate: String
    var page: Int
    var limit: Int
    var totalPage: Int
    var totalItem: Int
    var isLastPage = false
    
    init?(json: JSON) {
        self.lastDate = json["last_date"].stringValue
        self.page = json["page"].intValue
        self.totalPage = json["total_page"].intValue
        self.limit = json["limit"].intValue
        self.totalItem = json["total"].intValue
        if self.page == 0 && self.totalPage == 0 {
            self.isLastPage  = true
            return
        }
        self.isLastPage = self.page > self.totalPage
    }
}
