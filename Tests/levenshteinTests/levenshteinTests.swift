import XCTest
@testable import levenshtein

final class levenshteinTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(levenshtein().text, "Hello, World!")
    }
}
