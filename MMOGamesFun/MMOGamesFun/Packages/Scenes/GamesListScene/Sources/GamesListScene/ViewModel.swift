//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Combine
import DIContainer
import Foundation
import GetGamesUseCase

public final class ViewModel: ViewModelProtocol {
    public var stateChanged: StateChangeBlock?
    public var currentState: State = .empty {
        didSet {
            stateChanged?(currentState)
        }
    }

    var subscriptions = Set<AnyCancellable>()

    @LazyInjected
    var getListUseCase: UseCaseProtocol

    public init() {}

    public func get() {
        print("🍎🍎🍎🍎 get")

        getListUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] completion in
                print("👾 receiveCompletion \(completion)")
                guard case .failure(let error) = completion else { return }

                self.currentState = .error(error)
            }, receiveValue: { [unowned self] games in
                self.currentState = .populated(games.map(DisplayRow.init))
            })
            .store(in: &subscriptions)
    }
}

private extension DisplayRow {
    init(useCaseGame: Game) {
        self.title = useCaseGame.title
        self.subtitle = "[\(useCaseGame.platform)] " + "\(useCaseGame.developer)"
    }
}
