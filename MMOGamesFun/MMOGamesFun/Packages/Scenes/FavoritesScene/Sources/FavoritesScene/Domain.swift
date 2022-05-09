//
//  Domain.swift
//  
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Foundation

public struct DisplayRow {
    public let title: String
    public var subtitle: String?
}

public enum State {
    case populated([DisplayRow])
    case empty
    case error(Error)
}

public typealias StateChangeBlock = (State) -> Void
public typealias DisplayRowAction = () -> Void

public protocol ViewModelProtocol {
    var currentState: State { get }
    var stateChanged: StateChangeBlock? { set get }

    func get()
}
