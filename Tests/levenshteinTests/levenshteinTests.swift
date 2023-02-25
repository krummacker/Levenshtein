import XCTest
@testable import levenshtein

final class levenshteinTests: XCTestCase {
    func testExample() throws {
        let pairs: [[String]] = [
            ["Kaserne", "Kaverne", "1"],
            ["Himmel", "Hölle", "3"],
            ["Grün", "Blau", "4"],
            ["Hut", "Donaudampfschiffahrtskapitänsmütze", "3"],
            ["Zitrone", "Dampfschiff", "7"]
        ]
        for pair in pairs{
            let actual = String(levenshteinDistance(s1: pair[0], s2: pair[1]))
            let expected = pair[2]
            XCTAssertEqual(actual, expected)
        }
    }
}
