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
        guard let user = UserData.getActiveUser() else { return }
        provider = AllAssetProvider(userId: user.userId)
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
