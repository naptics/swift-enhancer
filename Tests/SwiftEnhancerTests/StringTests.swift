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

    func testFromBase64String() {
        let base64 = "SGVsbG8gV29ybGQ="
        XCTAssertEqual(base64.fromBase64(), "Hello World")

        let base64NoPadding = "SGVsbG8gV29ybGQ"
        XCTAssertEqual(base64NoPadding.fromBase64(), "Hello World")

        let base64NoPaddingNeeded = "SGVsbG8gV29ybGRz"
        XCTAssertEqual(base64NoPaddingNeeded.fromBase64(), "Hello Worlds")

        let invalidBase64String = "..."
        XCTAssertNil(invalidBase64String.fromBase64())
    }

    func testToBase64String() {
        let text = "Hello World"
        XCTAssertEqual(text.toBase64(), "SGVsbG8gV29ybGQ=")
    }
}
