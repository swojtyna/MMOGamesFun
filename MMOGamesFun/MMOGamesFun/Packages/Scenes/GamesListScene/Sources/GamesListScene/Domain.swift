//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import Foundation

public enum Route {}

public struct Input {
    var viewDidLoadTrigger: AnyPublisher<Void, Never>
}

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

extension DisplayRow: Hashable {
    var identifier: String {
        return title + "_" + String(isFavorite)
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    public static func == (lhs: DisplayRow, rhs: DisplayRow) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

struct EmptyDisplayData: Hashable {
    let message: String
}

struct ErrorDisplayData: Hashable {
    let message: String
}

public protocol ViewModelProtocol {
    var router: AnyPublisher<Route, Error> { get }
    var subscriptions: Set<AnyCancellable> { set get }

    func bind(input: Input) -> Output
}
