//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

import Combine
@testable import GamesListScene
import RemoveFavoriteGameUseCase
import XCTest

class RemoveFavoriteGameUseCaseMock: RemoveFavoriteGameUseCase.UseCaseProtocol {
    private(set) var didExecuteCalled = false

    func execute(gameId: GameId) {
        didExecuteCalled = true
    }
}
