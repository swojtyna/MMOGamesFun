//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation
import DIContainer
import GetGamesUseCase

public final class ViewModel: ViewModelProtocol {
    public var stateChanged: StateChangeBlock?
    public var currentState: State = .empty {
        didSet {
            stateChanged?(currentState)
        }
    }

    @LazyInjected
    var getListUseCase: UseCaseProtocol

    public init() {}

    public func get() {
        print("🍎🍎🍎🍎 get")

        getListUseCase.execute { [weak self] result in
            guard let self = self else { return }

            Task {
                switch result {
                case .success(let games):
    //                self.currentState = .populated(games.map(DisplayRow.init))
                    await self.updateState(with: .success(games.map(DisplayRow.init)))
                case .failure(let error):
    //                self.currentState = .error(error)
                    await self.updateState(with: .failure(error))
                }
            }


        }

//        let mockedData: [DisplayRow] = [.init(title: "test1",platform: "PC"),
//                                        .init(title: "test2",platform: "MOBILE"),
//                                        .init(title: "test3",platform: "MOBILE"),
//                                        .init(title: "test4",platform: "PSX5"),
//                                        .init(title: "test5",platform: "PSX5"),
//                                        .init(title: "test6",platform: "PSX5")]
//
//        currentState = .populated(mockedData)
    }

    @MainActor
    func updateState(with result: Result<[DisplayRow], Error>) {
        switch result {
        case .success(let games):
            self.currentState = .populated(games)
        case .failure(let error):
            self.currentState = .error(error)
        }
    }
}

private extension DisplayRow {
    init(useCaseGame: Game) {
        self.title = useCaseGame.title
        self.subtitle = "[\(useCaseGame.platform)] " + "\(useCaseGame.developer)"
    }
}
