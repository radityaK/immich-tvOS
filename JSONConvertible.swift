//
//  JSONConvertible.swift
//  
//
//  Created by Raditya Kurnianto on 6/5/20.
//  Copyright © 2020 detik. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Protocol that handle response from network request.
 */
protocol JSONConvertible {
    init?(json: JSON)
}
