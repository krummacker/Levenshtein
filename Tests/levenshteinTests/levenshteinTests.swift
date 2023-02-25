@testable import levenshtein
import XCTest

final class levenshteinTests: XCTestCase {
    func testLevenshteinDistance() throws {
        let pairs: [[String]] = [
            ["Mayor", "Major", "1"],
            ["Heaven", "Hell", "2"],
            ["Green", "Blue", "3"],
            ["Hat", "Fedora", "3"],
            ["Lemon", "Barque", "5"],
        ]
        for pair in pairs {
            let actual = String(levenshteinDistance(s1: pair[0], s2: pair[1]))
            let expected = pair[2]
            XCTAssertEqual(actual, expected)
        }
    }

    func testLeftPad() throws {
        let pairs: [[String]] = [
            ["Mayor", "10", "     Mayor"],
            ["Heaven", "1", "Heaven"],
            ["", "7", "       "],
        ]
        for pair in pairs {
            let s = pair[0]
            let length = Int(pair[1]) ?? 0
            let actual = leftPad(s: s, length: length)
            let expected = pair[2]
            XCTAssertEqual(actual, expected)
        }
    }
}
