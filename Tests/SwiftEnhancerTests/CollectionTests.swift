@testable import SwiftEnhancer
import XCTest

final class CollectionTests: XCTestCase {
    func testSafeIndexSubscript() {
        let array = ["A", "B", "C"]
        XCTAssertNil(array[safe: -1])
        XCTAssertEqual(array[safe: 0], "A")
        XCTAssertEqual(array[safe: 2], "C")
        XCTAssertNil(array[safe: 3])
    }
}
