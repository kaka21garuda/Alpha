//
//  AppDelegate.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/6/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        setStyles()
        
        return true
    }
    
    
    func setStyles() {
        UIWindow.appearance().tintColor = UIColor.white
        
        // UIButton.appearance().tintColor = UIColor.white
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}
