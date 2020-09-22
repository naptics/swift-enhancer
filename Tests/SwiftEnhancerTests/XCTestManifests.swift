import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(SwiftEnhancerTests.allTests),
        ]
    }
#endif
