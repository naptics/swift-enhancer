import XCTest
@testable import SwiftEnhancer

final class SequenceTests: XCTestCase {
    func testSortByKeyPath() {
        struct MyStruct {
            let param1: String
            let param2: Int
        }

        let structA = MyStruct(param1: "A", param2: 1)
        let structB = MyStruct(param1: "B", param2: 2)

        let array = [structA, structB].reversed()
        let sortedParam1 = array.sorted(by: \.param1)
        let sortedParam2 = array.sorted(by: \.param2)

        XCTAssertEqual(sortedParam1.first?.param1, structA.param1)
        XCTAssertEqual(sortedParam1.first?.param2, structA.param2)
        XCTAssertEqual(sortedParam2.first?.param1, structA.param1)
        XCTAssertEqual(sortedParam2.first?.param2, structA.param2)
    }
}
