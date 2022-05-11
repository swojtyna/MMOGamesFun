//
//  File.swift
//  
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation
import Combine

public struct DisplayRow {
    public let title: String
    public var subtitle: String?
}

public enum State {
    case populated([DisplayRow])
    case empty
    case error(Error)
}

public protocol ViewModelProtocol {
    var state: AnyPublisher<State, Never> { get }
}
