@testable import SwiftEnhancer
import XCTest

final class ArrayTests: XCTestCase {
    func testSubtractingArray() {
        let origin = ["a", "b", "c", "d"]
        let target = ["a", "e"]
        let subtracted = target.subtracting(origin)
        XCTAssertEqual(subtracted.count, 1)
        XCTAssertEqual(subtracted.first, "e")
    }
}
