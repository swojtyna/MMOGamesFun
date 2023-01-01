//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import Foundation

public enum Route {}

public struct Input {}

public struct Output {
    var displayRows: AnyPublisher<[DisplayRow], Never>
    var error: AnyPublisher<Error, Never>
}

public struct DisplayRow {
    public let title: String
    public var subtitle: String?
    public var isFavorite: Bool
    public var rowTapped: (() -> Void)?
}

public protocol ViewModelProtocol {
    var router: AnyPublisher<Route, Error> { get }
    var subscriptions: Set<AnyCancellable> { set get }

    func bind(input: Input) -> Output
}
