//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import DashboardCoordinatorDomain
import DIContainer
import UIKit

public final class Coordinator: CoordinatorProtocol {
    @LazyInjected
    var dashboardCoordinator: DashboardCoordinatorDomain.CoordinatorProtocol

    public init() {}

    public func start() -> UIViewController {
        let dashboardController = dashboardCoordinator.start()
        let navigationController = UINavigationController(rootViewController: dashboardController)

        dashboardController.tabBarItem.title = "Dashboard"
        dashboardController.tabBarItem.image = UIImage(systemName: "gamecontroller")
        dashboardController.tabBarItem.selectedImage = UIImage(systemName: "gamecontroller.fill")
        
        dashboardCoordinator.navigationController = navigationController

        return navigationController
    }
}
