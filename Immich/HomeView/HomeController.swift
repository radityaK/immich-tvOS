//
//  ViewController.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import UIKit
import RWExtensionPack

class HomeController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = HomeViewModel()
    
    lazy var layout: UICollectionViewFlowLayout = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(cell: CollectionViewAssetCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = self.layout
        collectionView.backgroundColor = .black
        collectionView.reloadData()
        
        viewModel.fetch()
        
        viewModel.onDataLoad = { [weak self] (response) in
            self?.collectionView.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfAsset
    }
}

extension HomeController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as CollectionViewAssetCell
        guard let asset = self.viewModel.getAsset(at: indexPath.row) else { return cell }
        cell.setupCell(asset: asset)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

