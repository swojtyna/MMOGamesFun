//
//  DIContainer+Injection.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import Foundation
import DIContainer
import GamesListScene
import GetGamesUseCase
import GamesRepository

import MMOGamesAPI

final class DIContainerInjection {
    static func registerAll() {

        DIContainer.register(type: ViewModelProtocol.self) { _ in
            ViewModel()
        }

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
