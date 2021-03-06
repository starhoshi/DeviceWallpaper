//
//  AppDelegate.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/04.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentArticlesScreen(in: window!)

        return true
    }
}
