//
//  ViewModel.swift
//  
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Foundation
import DIContainer
import GetGamesUseCase
import Combine

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
