//
//  DIContainer+Injection.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import AddFavoriteGameUseCase
import DashboardCoordinator
import DashboardCoordinatorDomain
import DashboardScene
import DashboardTabCoordinator
import DIContainer
import FavoritesCoordinator
import FavoritesRepository
import FavoritesScene
import FavoritesTabCoordinator
import Foundation
import GamesListCoordinator
import GamesListScene
import GamesRepository
import GetFavoritesGamesUseCase
import GetGamesUseCase
import HomeTabBarCoordinator
import MMOGamesAPI
import RemoveFavoriteGameUseCase

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
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self) { _ in
            GetGamesUseCase.UseCase()
        }

        DIContainer.register(type: AddFavoriteGameUseCase.UseCaseProtocol.self) { _ in
            AddFavoriteGameUseCase.UseCase()
        }

        DIContainer.register(type: RemoveFavoriteGameUseCase.UseCaseProtocol.self) { _ in
            RemoveFavoriteGameUseCase.UseCase()
        }

        DIContainer.register(type: GetFavoritesGamesUseCase.UseCaseProtocol.self) { _ in
            GetFavoritesGamesUseCase.UseCase()
        }
    }

    static func registerRepositories() {
        DIContainer.register(type: GamesRepository.RepositoryProtocol.self, object: { _ in
            GamesRepository.Repository()
        }, scope: .application)

        DIContainer.register(type: FavoritesRepository.RepositoryProtocol.self, object: { _ in
            FavoritesRepository.Repository()
        }, scope: .application)
    }

    static func registerNetworksLayer() {
        DIContainer.register(type: MMOGamesAPIProtocol.self) { _ in
            MMOGamesAPI()
        }
    }
}
