//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

import XCTest

public func AssertEqual<T>(
    _ received: T,
    _ expected: T,
    file: StaticString = #file,
    line: UInt = #line
) {
    let lhs = String(describing: received)
    let rhs = String(describing: expected)
    XCTAssertTrue(
        lhs == rhs,
        "Found diffrence for: \(lhs) \(rhs)", // would be better use it https://github.com/krzysztofzablocki/Difference
        file: file,
        line: line
    )
}
