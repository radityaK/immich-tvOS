//
//  AssetViewerViewController.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import UIKit
import SDWebImage

class AssetViewerViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var assetItem: Asset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let asset = assetItem {
            let urlAsset = "https://photos.gardenia-cloud.my.id/api/asset/thumbnail/\(asset.id)"
            self.imageView.sd_setImage(with: URL(string: urlAsset))
        }
    }
}
