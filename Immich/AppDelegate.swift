//
//  AppDelegate.swift
//  Immich
//
//  Created by Raditya Kurnianto on 16/04/24.
//

import UIKit
import SDWebImage
import SDWebImageWebPCoder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let navController = window?.rootViewController as? UINavigationController else { return true }
        
        guard let user = UserData.getActiveUser() else {
            // set to login page
            let loginController = LoginViewController()
            navController.setViewControllers([loginController], animated: true)
            return true
        }
        
        let requestModifier = SDWebImageDownloaderRequestModifier { request in
            var mutableRequest = request
            mutableRequest.setValue("Bearer \(user.accessToken)", forHTTPHeaderField: "Authorization")
            return mutableRequest
        }
        SDWebImageDownloader.shared.requestModifier = requestModifier
        // Add WebP support, do this just after launching (AppDelegate)
        SDImageCodersManager.shared.addCoder(SDImageAWebPCoder.shared)
        SDImageCodersManager.shared.addCoder(SDImageWebPCoder.shared)

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyBoard.instantiateViewController(withIdentifier: "tabbar")
        navController.setViewControllers([tabbar], animated: true)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    
}

