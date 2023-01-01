//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import DIContainer
import Foundation

public final class ViewModel: ViewModelProtocol {
    public var router: AnyPublisher<Route, Error> { routerPassthroughSubject.eraseToAnyPublisher() }
    private var routerPassthroughSubject = PassthroughSubject<Route, Error>()

    private var subscriptions = Set<AnyCancellable>()

    public init() {}
    
    public func bind(input: Input) -> Output {
        input.gameListTapped
            .map { _ in Route.gameList }
            .sink(receiveValue: { [routerPassthroughSubject] route
                in routerPassthroughSubject.send(route)
            })
            .store(in: &subscriptions)

        let releaseDate = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
            .autoconnect()
            .eraseToAnyPublisher()

        return Output(releaseDate: releaseDate)
    }
}
