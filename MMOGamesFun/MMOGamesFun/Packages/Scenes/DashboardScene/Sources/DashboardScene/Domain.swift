//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Foundation
import Combine

public enum Route {
    case gameList
}

public struct Input {
    var gameListTapped: AnyPublisher<Void, Never>
}

public struct Output {
    var releaseDate: AnyPublisher<Date, Never>
}

public protocol ViewModelProtocol: ObservableObject {
    var router: AnyPublisher<Route, Error> { get }

    func bind(input: Input) -> Output
}
