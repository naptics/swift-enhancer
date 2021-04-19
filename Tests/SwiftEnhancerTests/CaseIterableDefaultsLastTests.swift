@testable import SwiftEnhancer
import XCTest

final class CaseIterableDefaultsLastTests: XCTestCase {
    private enum Item: String, Codable, CaseIterableDefaultsLast {
        case one = "item one"
        case two = "item two"
        case any
    }

    private struct Object: Codable {
        let item: Item
    }

    func testSelectItem() throws {
        let object = Object(item: .one)
        let data = try JSONEncoder().encode(object)
        let decodedObject = try JSONDecoder().decode(Object.self, from: data)
        XCTAssertEqual(decodedObject.item, .one)

        let jsonData = """
        {
            "item": "item two"
        }
        """.data(using: .utf8)!
        let decodedObject2 = try JSONDecoder().decode(Object.self, from: jsonData)
        XCTAssertEqual(decodedObject2.item, .two)
    }

    func testSelectDefaultLast() throws {
        let jsonData = """
        {
            "item": "unknown item"
        }
        """.data(using: .utf8)!
        let decodedObject = try JSONDecoder().decode(Object.self, from: jsonData)
        XCTAssertEqual(decodedObject.item, .any)
    }
}
