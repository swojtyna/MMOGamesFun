//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import GamesListCoordinator
import UIKit
import DIContainer
import DashboardScene
import SwiftUI
import Combine

public final class Coordinator: CoordinatorProtocol {
    public weak var navigationController: UINavigationController? // It shouldn't know about it

    @LazyInjected
    var gamesListCoordinator: GamesListCoordinator.CoordinatorProtocol

    private var subscriptions = Set<AnyCancellable>()

    public init() {}

    public func start() -> UIViewController {
        let viewModel = ViewModel()
        let dashboardView = DashboardView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: dashboardView)

        viewModel.router
            .map(handleRoute)
            .sink(receiveCompletion: {_ in }, receiveValue: {})
            .store(in: &subscriptions)

        return viewController
    }

    public func handleRoute(_ route: Route) {
        switch route {
        case .gameList:
            let gamesListController = gamesListCoordinator.start()
            navigationController?.pushViewController(gamesListController, animated: true) // this should be delegated to DashboardTabCoordinator
        }
    }
}
