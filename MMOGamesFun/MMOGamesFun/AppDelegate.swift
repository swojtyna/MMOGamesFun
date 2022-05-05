//
//  AppDelegate.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import UIKit
import GamesListScene

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        DIContainerInjection.registerAll()

        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }
}
