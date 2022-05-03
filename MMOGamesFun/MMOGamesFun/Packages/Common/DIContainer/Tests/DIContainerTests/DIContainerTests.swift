import XCTest
@testable import DIContainer

final class DIContainerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DIContainer().text, "Hello, World!")
    }
}
