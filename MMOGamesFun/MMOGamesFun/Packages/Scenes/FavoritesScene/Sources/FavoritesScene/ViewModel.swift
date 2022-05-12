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
import GetFavoritesGamesUseCase
import RemoveFavoriteGameUseCase

public final class ViewModel: ViewModelProtocol {
    public lazy var state: AnyPublisher<State, Never> = {
        getListUseCase.execute()
            .compactMap { useCaseGames in
                var displayRows: [DisplayRow] = useCaseGames.map { [weak self] game in
                    var displayRow = DisplayRow(useCaseGame: game)

                    displayRow.tapRowAction = {
                        self?.addToFavorite(gameId: game.id)
                        if game.isFavorite {
                            self?.removeFromFavorite(gameId: game.id)

                        } else {
                            self?.addToFavorite(gameId: game.id)
                        }
                    }
                    return displayRow
                }
                return .populated(displayRows)
            }
            .catch { error in Just(.error(error)) }
            .eraseToAnyPublisher()
    }()

    @LazyInjected
    var getListUseCase: GetFavoritesGamesUseCase.UseCaseProtocol

    @LazyInjected
    var addFavoriteGameUseCase: AddFavoriteGameUseCase.UseCaseProtocol

    @LazyInjected
    var removeFavoriteGameUseCase: RemoveFavoriteGameUseCase.UseCaseProtocol

    public init() {}
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
    init(useCaseGame: Game) {
        self.title = useCaseGame.title
        self.subtitle = "[\(useCaseGame.platform)] " + "\(useCaseGame.developer)"
        self.isFavorite = useCaseGame.isFavorite
    }
}
