//
//  AppDelegate.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import UIKit
import GamesListScene
import DashboardScene
import HomeTabBarCoordinator
import DIContainer
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    @LazyInjected
    var homeTabBarCoordinator: CoordinatorProtocol

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        DIContainerInjection.registerAll()

        window = UIWindow()
        window?.rootViewController = homeTabBarCoordinator.start()
//        window?.rootViewController = ViewController()
//        window?.rootViewController = UIHostingController(rootView: DashboardView())
        window?.makeKeyAndVisible()

        return true
    }
}
