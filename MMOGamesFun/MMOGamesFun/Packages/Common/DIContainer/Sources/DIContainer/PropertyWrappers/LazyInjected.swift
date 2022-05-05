//
//  File.swift
//  
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation

@propertyWrapper
public final class LazyInjected<Value> {
    private lazy var value: Value = DIContainer.resolve(Value.self)

    public var wrappedValue: Value {
        get { return value }
        set { value = newValue }
    }

    public init() { }
}
