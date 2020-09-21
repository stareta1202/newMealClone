//
//  AppDelegate.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initMainViews()
        
        return true
    }
    
    private func initMainViews()
    {
        let myPageViewController = MyPageViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = myPageViewController
        window?.makeKeyAndVisible()
        
    }

}

