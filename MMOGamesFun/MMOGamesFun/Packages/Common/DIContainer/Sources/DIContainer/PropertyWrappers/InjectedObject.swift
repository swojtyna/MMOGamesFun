//
//  InjectedObject.swift
//  
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Foundation
import SwiftUI

@propertyWrapper
public final class InjectedObject<Value>: DynamicProperty where Value: ObservableObject {
    @ObservedObject private var value: Value = DIContainer.resolve(Value.self)

    public var wrappedValue: Value {
        get { return value }
        set { value = newValue }
    }

    public init() { }
}
