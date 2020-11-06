@testable import SwiftEnhancer
import XCTest

final class CharacterSetTests: XCTestCase {
    func testRFC3986Unreserved() {
        let unreserved = CharacterSet(charactersIn: "-._~")
        let alphanumeric = CharacterSet.alphanumerics
        XCTAssertTrue(unreserved.isSubset(of: .rfc3986Unreserved))
        XCTAssertTrue(alphanumeric.isSubset(of: .rfc3986Unreserved))
    }
}
