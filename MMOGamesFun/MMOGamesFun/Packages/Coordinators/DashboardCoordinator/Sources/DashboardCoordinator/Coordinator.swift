//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import GamesListCoordinator
import UIKit
import DIContainer
import DashboardCoordinatorDomain
import DashboardScene
import SwiftUI

public final class Coordinator: DashboardCoordinatorDomain.CoordinatorProtocol {
    public weak var navigationController: UINavigationController? // It shouldn't know about it

    @LazyInjected
    var gamesListCoordinator: GamesListCoordinator.CoordinatorProtocol

    public init() {}

    public func start() -> UIViewController {
        let dashboardView = DashboardView()
        let viewController = UIHostingController(rootView: dashboardView)
        dashboardView.viewModel.coordinator = self

        return viewController
    }

    public func showGameList() {
        let gamesListController = gamesListCoordinator.start()
        navigationController?.pushViewController(gamesListController, animated: true) // this should be delegated to DashboardTabCoordinator
    }
}
