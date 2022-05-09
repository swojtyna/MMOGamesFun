//
//  DIContainer+Injection.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import DashboardScene
import DIContainer
import Foundation
import GamesListScene
import GamesRepository
import GetGamesUseCase

import MMOGamesAPI

final class DIContainerInjection {
    static func registerAll() {
        DIContainer.register(type: GamesListScene.ViewModelProtocol.self) { _ in
            GamesListScene.ViewModel()
        }

        // SWiftUI Solution ;/
        DIContainer.register(object: ({ _ in DashboardScene.ViewModel() }), scope: .shared)

        DIContainer.register(type: UseCaseProtocol.self) { _ in
            UseCase()
        }

        DIContainer.register(type: RepositoryProtocol.self) { _ in
            Repository()
        }

        DIContainer.register(type: MMOGamesAPIProtocol.self) { _ in
            MMOGamesAPI()
        }
    }
}
