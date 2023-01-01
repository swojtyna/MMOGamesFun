//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import AddFavoriteGameUseCase
import Combine
import DIContainer
import Foundation
import GetGamesUseCase
import RemoveFavoriteGameUseCase

public final class ViewModel: ViewModelProtocol {
    public var router: AnyPublisher<Route, Error> { routerPassthroughSubject.eraseToAnyPublisher() }
    private var routerPassthroughSubject = PassthroughSubject<Route, Error>()

    public var subscriptions = Set<AnyCancellable>()

    @LazyInjected
    var getListUseCase: GetGamesUseCase.UseCaseProtocol

    @LazyInjected
    var addFavoriteGameUseCase: AddFavoriteGameUseCase.UseCaseProtocol

    @LazyInjected
    var removeFavoriteGameUseCase: RemoveFavoriteGameUseCase.UseCaseProtocol

    public init() {}

    public func bind(input: Input) -> Output {
        let getList = getListUseCase.execute()

        let displayRows: AnyPublisher<[DisplayRow], Never> = getList
            .compactMap { useCaseGames in
                useCaseGames.map { [unowned self] game in
                    let rowAction: () -> Void = { [unowned self] in
                        if game.isFavorite {
                            removeFromFavorite(gameId: game.id)
                        } else {
                            addToFavorite(gameId: game.id)
                        }
                    }

                    return DisplayRow(useCaseGame: game, rowTapped: rowAction)
                }
            }
            .replaceError(with: [])
            .eraseToAnyPublisher()

        let getError = PassthroughSubject<Error, Never>()

        getList
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    getError.send(error)
                case .finished: break
                }
            }, receiveValue: { _ in })
            .store(in: &subscriptions)

        return Output(displayRows: displayRows, error: getError.eraseToAnyPublisher())
    }
}

private extension ViewModel {
    func addToFavorite(gameId: AddFavoriteGameUseCase.GameId) {
        addFavoriteGameUseCase.execute(gameId: gameId)
    }

    func removeFromFavorite(gameId: RemoveFavoriteGameUseCase.GameId) {
        removeFavoriteGameUseCase.execute(gameId: gameId)
    }
}

private extension DisplayRow {
    init(useCaseGame: Game, rowTapped: (() -> Void)? = nil) {
        self.title = useCaseGame.title
        self.subtitle = "[\(useCaseGame.platform)] " + "\(useCaseGame.developer)"
        self.isFavorite = useCaseGame.isFavorite
        self.rowTapped = rowTapped
    }
}

