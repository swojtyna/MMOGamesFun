//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

import Combine
import Foundation
import XCTest

//// Based on: https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
public extension XCTestCase {
    func awaitPublisher<T: Publisher>(
        _ publisher: T,
        timeout: TimeInterval = 0.2,
        file: StaticString = #file,
        line: UInt = #line,
        afterAction action: (() throws -> Void)? = nil
    ) throws -> T.Output {
        // This time, we use Swift's Result type to keep track
        // of the result of our Combine pipeline:
        var result: Result<T.Output, Error>?
        let expectation = self.expectation(description: "Awaiting publisher")

        let cancellable = publisher
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        result = .failure(error)
                        expectation.fulfill()
                    case .finished:
                        break
                    }

                },
                receiveValue: { value in
                    result = .success(value)
                    expectation.fulfill()
                }
            )

        try action?()

        // Just like before, we await the expectation that we
        // created at the top of our test, and once done, we
        // also cancel our cancellable to avoid getting any
        // unused variable warnings:
        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        // Here we pass the original file and line number that
        // our utility was called at, to tell XCTest to report
        // any encountered errors at that original call site:
        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )

        return try unwrappedResult.get()
    }
}
