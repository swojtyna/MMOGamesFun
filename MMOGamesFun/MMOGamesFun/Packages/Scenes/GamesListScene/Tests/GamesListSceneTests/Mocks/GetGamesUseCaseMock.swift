//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

import Combine
@testable import GamesListScene
import GetGamesUseCase
import XCTest

class GetGamesUseCaseMock: GetGamesUseCase.UseCaseProtocol {
    private let result: Result<[Game], Error>

    init(result: Result<[Game], Error>) {
        self.result = result
    }

    func execute() -> AnyPublisher<[Game], Error> {
        return result.publisher.eraseToAnyPublisher()
    }
}
