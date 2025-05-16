//
//  HomeViewModel.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import Foundation
import SwiftyJSON

class HomeViewModel: NSObject {
    var onDataLoad: ((ApiResponse<TimeRange>) -> Void)?
    var onAssetFetch: ((ApiResponse<Asset>) -> Void)?
    var timeRangeCollection: [TimeRange]?
    var numberOfTimeRange = 0
    var provider: TimeBucketsProvider?
    var numberOfAsset = 0
    var assetCollection: [Asset]?
    
    func getAsset(at: Int) -> Asset? {
        return self.assetCollection?[exist: at]
    }
}

extension HomeViewModel: Loadable {
    typealias Response = ApiResponse<TimeRange>
    
    func fetch() {
        provider = TimeBucketsProvider()
        guard let param = provider else { return }
        Api.shared.request(endpoint: .timeBuckets(provider: param)) { [weak self] (response : ApiResponse<TimeRange>) in
            if let _ = response.error {
                if let callback = self?.onDataLoad { callback(response) }
                return
            }
            
            if let array = response.array {
                self?.numberOfTimeRange = array.count
                self?.fetchAssetForSpecific(range: array.first?.timeBucket ?? "")
            }
        }
    }
    
    func fetchAssetForSpecific(range: String) {
        let provider = SpecificTimeBucket(size: "MONTH", timeBucket: range)
        Api.shared.request(endpoint: .allAsset(provider: provider)) { [weak self] (response: ApiResponse<Asset>) in
            if let _ = response.error {
                if let callback = self?.onAssetFetch { callback(response) }
                return
            }
            
            if let array = response.array, let callback = self?.onAssetFetch {
                self?.numberOfAsset = array.count
                self?.assetCollection = array
                callback(response)
            }
        }
    }
}
