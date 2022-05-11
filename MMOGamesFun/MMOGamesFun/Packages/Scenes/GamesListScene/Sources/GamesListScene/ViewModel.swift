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
    public lazy var state: AnyPublisher<State, Never> = {
        getListUseCase.execute()
            .compactMap { .populated($0.map(DisplayRow.init)) }
            .catch { error in Just(.error(error)) }
            .eraseToAnyPublisher()
    }()

    @LazyInjected
    var getListUseCase: UseCaseProtocol

    public init() {}
}

private extension DisplayRow {
    init(useCaseGame: Game) {
        self.title = useCaseGame.title
        self.subtitle = "[\(useCaseGame.platform)] " + "\(useCaseGame.developer)"
    }
}
