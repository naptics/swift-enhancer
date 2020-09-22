@testable import SwiftEnhancer
import XCTest

final class IntTests: XCTestCase {
    func testIntFromStringDefaultValue() {
        let int1 = Int("1", default: 100)
        let int2 = Int("", default: 100)
        let int3 = Int("ABC123", default: 100)
        let int4 = Int("123ABC", default: 100)

        XCTAssertEqual(int1, 1)
        XCTAssertEqual(int2, 100)
        XCTAssertEqual(int3, 100)
        XCTAssertEqual(int4, 100)
    }
}
