//
//  Loadable.swift
//  CNBC
//
//  Created by Raditya Kurnianto on 6/17/20.
//  Copyright © 2020 detik. All rights reserved.
//

import Foundation

protocol Loadable {
    associatedtype Response
    associatedtype Provider
    
    var onDataLoad: ((Response) -> Void)? { get set }
    var provider: Provider { get set }

    func fetch() -> Void
}

extension Loadable {
    func reload() -> Void { }
    func loadMore() -> Void { }
}
