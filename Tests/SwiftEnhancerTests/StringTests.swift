@testable import SwiftEnhancer
import XCTest

final class StringTests: XCTestCase {
    func testNilOrEmpty() {
        let nilString: String? = nil
        let emptyString: String? = ""
        let nonEmptyString: String? = "Hello"

        XCTAssertTrue(nilString.isNilOrEmpty)
        XCTAssertTrue(emptyString.isNilOrEmpty)
        XCTAssertFalse(nonEmptyString.isNilOrEmpty)
    }
}
