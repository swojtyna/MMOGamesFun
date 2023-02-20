//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import AddFavoriteGameUseCase
import Combine
import CombineExt
import DIContainer
import Foundation
import GetGamesUseCase
import RemoveFavoriteGameUseCase

public final class ViewModel: ViewModelProtocol {
    public var router: AnyPublisher<Route, Error> { routerPassthroughSubject.eraseToAnyPublisher() }
    private let routerPassthroughSubject = PassthroughSubject<Route, Error>()

    public var subscriptions = Set<AnyCancellable>()

    @LazyInjected
    var getListUseCase: GetGamesUseCase.UseCaseProtocol

    @LazyInjected
    var addFavoriteGameUseCase: AddFavoriteGameUseCase.UseCaseProtocol

    @LazyInjected
    var removeFavoriteGameUseCase: RemoveFavoriteGameUseCase.UseCaseProtocol

    public init() {}

    public func bind(input: Input) -> Output {
        let getList = input.viewDidLoadTrigger
            .flatMapLatest { _ -> AnyPublisher<Event<[Game], Error>, Never> in
                self.getListUseCase
                    .execute()
                    .materialize()
                    .eraseToAnyPublisher()
            }
            .share()
            .eraseToAnyPublisher()

        let displayRows: AnyPublisher<[DisplayRow], Never> = getList
            .values()
            .map { self.makeDisplayRows(from: $0) }
            .eraseToAnyPublisher()

        let error = getList
            .failures()

        return Output(displayRows: displayRows, error: error)
    }
}

private extension ViewModel {
    func makeDisplayRows(from games: [Game]) -> [DisplayRow] {
        return games.map { [weak self] game in
            DisplayRow(
                useCaseGame: game,
                rowTapped: self.map { $0.makeRowAction(game: game) }
            )
        }
    }

    func makeRowAction(game: Game) -> (() -> Void) {
        if game.isFavorite {
            return { [weak self] in
                self?.removeFavoriteGameUseCase.execute(gameId: game.id)

            }
        } else {
            return { [weak self] in
                self?.addFavoriteGameUseCase.execute(gameId: game.id)
                
            }
        }
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
