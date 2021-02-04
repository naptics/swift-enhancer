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

    func testHexStringToByteArray() {
        let hexString = "ABCDEF01"
        XCTAssertEqual(hexString.hexStringToByteArray, [0xAB, 0xCD, 0xEF, 0x01])

        let invalidHexString = "ABC"
        XCTAssertNil(invalidHexString.hexStringToByteArray)

        let invalidHexCharacter = "ABCX"
        XCTAssertNil(invalidHexCharacter.hexStringToByteArray)
    }

    func testTruncated() {
        XCTAssertEqual("Hello World".truncated(after: 7, at: .trailing, with: "..."), "Hello W...")
        XCTAssertEqual("Hello World".truncated(after: 7, at: .leading, with: "..."), "...o World")
        XCTAssertEqual("Hello World".truncated(after: 7, at: .center, with: "..."), "He...ld")
        XCTAssertEqual("Hello".truncated(after: 7, at: .center, with: "..."), "Hello")
    }

    func testIsValidHexNumber() {
        XCTAssertTrue("ABCDEF01".isValidHexNumber)
        XCTAssertFalse("XY".isValidHexNumber)
        XCTAssertFalse("ABCDXY".isValidHexNumber)
        XCTAssertFalse("XYABCD".isValidHexNumber)
    }

    @available(OSX 10.12, iOS 10.0, *)
    func testToISO8601Date() {
        XCTAssertNotNil("2020-10-03T15:57:43-02:00".toISO8601Date())
        XCTAssertNotNil("2020-10-03T15:57:43Z".toISO8601Date())
    }

    func testIsBlank() {
        XCTAssertTrue("".isBlank)
        XCTAssertTrue(" ".isBlank)
        XCTAssertFalse("A".isBlank)
        XCTAssertFalse(" A ".isBlank)
    }

    func testIsNilOrBlank() {
        var nilString: String?
        XCTAssertTrue(nilString.isNilOrBlank)
        nilString = ""
        XCTAssertTrue(nilString.isNilOrBlank)
        nilString = " "
        XCTAssertTrue(nilString.isNilOrBlank)
        nilString = "A"
        XCTAssertFalse(nilString.isNilOrBlank)
        nilString = " A "
        XCTAssertFalse(nilString.isNilOrBlank)
    }
}
