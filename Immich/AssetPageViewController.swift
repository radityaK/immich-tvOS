//
//  AssetPageViewController.swift
//  Immich
//
//  Created by Raditya Kurnianto on 17/04/24.
//

import UIKit
import Pageboy
import RWExtensionPack

class AssetPageViewController: PageboyViewController {
    var totalPage = 0
    var selectedPageIndex = 0
    var assetCollection = [Asset]()
    var viewControllers = [AssetViewerViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assetCollection.forEach { asset in
            let controller = AssetViewerViewController(assetItem: asset)
            viewControllers.append(controller)
        }
        
        self.dataSource = self
    }
}

extension AssetPageViewController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        self.totalPage
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        viewControllers[exist: index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        Page.at(index: selectedPageIndex)
    }
}
