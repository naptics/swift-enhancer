import XCTest
@testable import SwiftEnhancer

final class SwiftEnhancerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftEnhancer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
