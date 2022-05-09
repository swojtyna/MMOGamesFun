//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import DashboardTabCoordinator
import DIContainer
import FavoritesTabCoordinator
import UIKit

public final class Coordinator: CoordinatorProtocol {
    @LazyInjected
    var dashboardTabCoordinator: DashboardTabCoordinator.CoordinatorProtocol

    @LazyInjected
    var favoritesTabCoordinator: FavoritesTabCoordinator.CoordinatorProtocol

    public init() {}

    public func start() -> UIViewController {
        let tabBarViewController = UITabBarController()

        tabBarViewController.viewControllers = [
            dashboardTabCoordinator.start(),
            favoritesTabCoordinator.start(),
            makeMoreMock(),
        ]
        return tabBarViewController
    }
}

private extension Coordinator {
    // PLACEHOLDER
    // It will be removed in future
    func makeMoreMock() -> UIViewController {
        let controller = UIViewController()
        controller.title = "More"
        controller.tabBarItem.title = "More"
        controller.tabBarItem.image = UIImage(systemName: "ellipsis.circle")
        controller.tabBarItem.selectedImage = UIImage(systemName: "ellipsis.circle.fill")
        controller.view.backgroundColor = .white

        return UINavigationController(rootViewController: controller)
    }
}
