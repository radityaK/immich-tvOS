//
//  AssetViewerViewController.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import UIKit
import SDWebImage
import AVKit

import SwiftUI

class AssetViewerViewController: UIViewController {
    @IBOutlet weak var playIndicatorImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var assetItem: Asset?
    
    init(assetItem: Asset? = nil) {
        self.assetItem = assetItem
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.playButton.isEnabled = true
        
        if let asset = assetItem {
            let urlAsset = "https://photos.gardenia-cloud.my.id/api/asset/thumbnail/\(asset.id)"
            self.imageView.sd_setImage(with: URL(string: urlAsset))
            self.imageView.isHidden = true
            if asset.type.lowercased() == "video" {
//                self.playButton.isHidden = false
//                self.playIndicatorImageView.isHidden = false
//                self.iconImageView.isHidden = false
                self.playButton.isHidden = true
                self.playIndicatorImageView.isHidden = true
                self.iconImageView.isHidden = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [weak self] in
                    self?.createPlayer()
                })
            } else {
                self.playButton.isHidden = true
                self.playIndicatorImageView.isHidden = true
                self.iconImageView.isHidden = true
            }
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        self.createPlayer()
    }
    
}

extension AssetViewerViewController {
    //    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    //        self.playIndicatorImageView.adjustsImageWhenAncestorFocused = true
    //    }
    
    func createPlayer() {
        guard let asset  = assetItem,
              let url = URL(string: "https://photos.gardenia-cloud.my.id/api/asset/file/\(asset.id)")
        else { return }
        let headers: [String: String] = ["x-api-key": "JjlipfdvMPAy3DBNTFibqYwYLNStxMV1iklIbhX5E"]
        let avAsset = AVURLAsset(url: url, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
        
        let playerItem = AVPlayerItem(asset: avAsset)
        
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(playerItem: playerItem)
        
        let hostingController = UIHostingController(rootView: VideoView(player: player))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

struct VideoView: View {
    var player: AVPlayer
    
    var body: some View {
        VideoPlayer(player: player).onAppear(perform: {
            player.play()
        })
    }
}
