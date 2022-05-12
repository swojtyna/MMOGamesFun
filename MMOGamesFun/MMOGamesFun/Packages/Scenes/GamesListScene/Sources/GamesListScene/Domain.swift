//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import Foundation

public struct DisplayRow {
    public let title: String
    public var subtitle: String?
    public var isFavorite: Bool
    public var tapRowAction: DisplayRowAction?
}

public enum State {
    case populated([DisplayRow])
    case empty
    case error(Error)
}

public typealias DisplayRowAction = () -> Void

public protocol ViewModelProtocol {
    var state: AnyPublisher<State, Never> { get }
}
