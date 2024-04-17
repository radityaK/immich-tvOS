//
//  HomeViewModel.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import SwiftyJSON

class HomeViewModel: NSObject {
    var provider: AllAssetProvider?
    var onDataLoad: ((ApiResponse<Asset>) -> Void)?
    var assetCollection: [Asset]?
    var numberOfAsset = 0
    
    func getAsset(at: Int) -> Asset? {
        return self.assetCollection?[exist: at]
    }
}

extension HomeViewModel: Loadable {
    typealias Response = ApiResponse<Asset>
    
    func fetch() {
        provider = AllAssetProvider(userId: "0098fbbf-86e4-4d13-9d23-1e7869a82c10")
        guard let param = provider else { return }
        Api.shared.request(endpoint: .allAsset(provider: param)) { [weak self] (response : ApiResponse<Asset>) in
            if let _ = response.error {
                if let callback = self?.onDataLoad { callback(response) }
                return
            }
            
            if let array = response.array {
                self?.numberOfAsset = array.count
                self?.assetCollection = array
                if let callback = self?.onDataLoad { callback(response) }
                return
            }
            print("data \(response.array)")
        }
    }
}
