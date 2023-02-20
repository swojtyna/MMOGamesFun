//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

import AddFavoriteGameUseCase
import Combine
@testable import GamesListScene
import XCTest

class AddFavoriteGameUseCaseMock: AddFavoriteGameUseCase.UseCaseProtocol {
    private(set) var didExecuteCalled = false

    func execute(gameId: GameId) {
        didExecuteCalled = true
    }
}
