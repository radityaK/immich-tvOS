//
//  Pageable.swift
//  CNBC
//
//  Created by Raditya Kurnianto on 7/29/20.
//  Copyright © 2020 detik. All rights reserved.
//

import Foundation

protocol Pageable {
    var limit: Int { get set }
    var page: Int { get set }
}

extension Pageable {
    var limit: Int {
        get { return 10 } set {}
    }
}
