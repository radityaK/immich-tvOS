//
//  CollectionViewAssetCell.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import UIKit
import SDWebImage
import RWExtensionPack

class CollectionViewAssetCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var assetImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(asset: Asset) {
        if asset.type.lowercased() == "video" {
            self.iconImageView.isHidden = false
        } else {
            self.iconImageView.isHidden = true
        }
    
        let urlAsset = "https://photos.gardenia-cloud.my.id/api/asset/thumbnail/\(asset.id)"
        self.assetImageView.sd_setImage(with: URL(string: urlAsset), placeholderImage: UIImage(named: "placeholder"), context: [:])
    }
}

extension CollectionViewAssetCell {
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        self.assetImageView.adjustsImageWhenAncestorFocused = self.isFocused
    }
}
