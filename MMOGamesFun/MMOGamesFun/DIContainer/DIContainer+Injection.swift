//
//  DIContainer+Injection.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import DashboardCoordinator
import DashboardScene
import DashboardTabCoordinator
import DashboardCoordinatorDomain
import DIContainer
import FavoritesCoordinator
import FavoritesScene
import FavoritesTabCoordinator
import Foundation
import GamesListScene
import GamesRepository
import GamesListCoordinator
import GetGamesUseCase
import HomeTabBarCoordinator
import MMOGamesAPI

final class DIContainerInjection {
    static func registerAll() {
        registerCoordinators()
        registerViewModels()
        registerUseCases()
        registerRepositories()
        registerNetworksLayer()
    }

    static func registerCoordinators() {
        DIContainer.register(type: HomeTabBarCoordinator.CoordinatorProtocol.self) { _ in
            HomeTabBarCoordinator.Coordinator()
        }

        DIContainer.register(type: DashboardTabCoordinator.CoordinatorProtocol.self) { _ in
            DashboardTabCoordinator.Coordinator()
        }

        DIContainer.register(type: DashboardCoordinatorDomain.CoordinatorProtocol.self) { _ in
            DashboardCoordinator.Coordinator()
        }

        DIContainer.register(type: FavoritesTabCoordinator.CoordinatorProtocol.self) { _ in
            FavoritesTabCoordinator.Coordinator()
        }

        DIContainer.register(type: FavoritesCoordinator.CoordinatorProtocol.self) { _ in
            FavoritesCoordinator.Coordinator()
        }

        DIContainer.register(type: GamesListCoordinator.CoordinatorProtocol.self) { _ in
            GamesListCoordinator.Coordinator()
        }
    }

    static func registerViewModels() {
        DIContainer.register(type: GamesListScene.ViewModelProtocol.self) { _ in
            GamesListScene.ViewModel()
        }

        // SWiftUI Solution ;/
        DIContainer.register(object: ({ _ in DashboardScene.ViewModel() }), scope: .shared)

        DIContainer.register(type: FavoritesScene.ViewModelProtocol.self) { _ in
            FavoritesScene.ViewModel()
        }
    }

    static func registerUseCases() {
        DIContainer.register(type: UseCaseProtocol.self) { _ in
            UseCase()
        }
    }

    static func registerRepositories() {
        DIContainer.register(type: RepositoryProtocol.self) { _ in
            Repository()
        }
        // add scope
    }

    static func registerNetworksLayer() {
        DIContainer.register(type: MMOGamesAPIProtocol.self) { _ in
            MMOGamesAPI()
        }
    }
}
