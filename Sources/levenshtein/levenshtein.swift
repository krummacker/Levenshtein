import Foundation

/// Computes the Levenshtein distance between the given strings `s1` and `s2`. The Levenshtein
/// distance between two words is the minimum number of single-character edits (insertions,
/// deletions or substitutions) required to change one word into the other.
///
/// ```
/// let d: Int = levenshteinDistance(s1: "major", s2: "mayor")  // d = 1
/// ```
///
/// - Parameters:
///     - s1: The first of the given strings.
///     - s2: The second of the given strings.
///
/// - Returns: The Levenshtein distance between the given strings `s1` and `s2`.
func levenshteinDistance(s1: String, s2: String) -> Int {
    if s1.isEmpty {
        return s2.count
    }
    if s2.isEmpty {
        return s1.count
    }

    // drop first letter of each string
    let s1Crop = String(s1.dropFirst(1))
    let s2Crop = String(s2.dropFirst(1))

    // if first characters are equal, continue with both cropped
    if s1[s1.startIndex] == s2[s2.startIndex] {
        return levenshteinDistance(s1: s1Crop, s2: s2Crop)
    }

    // otherwise find smallest of the three options
    let (c1, c2, c3) = (levenshteinDistance(s1: s1Crop, s2: s2),
                        levenshteinDistance(s1: s1, s2: s2Crop),
                        levenshteinDistance(s1: s1Crop, s2: s2Crop))
    return 1 + min(min(c1, c2), c3)
}

/// Prefixes the specified string `s` with enough spaces so that the specified `length` is reached.
/// If `s` is not shorter than `length` characters then `s` is left unchanged.
///
/// ```
/// let s: String = leftPad(s: "Hello", length: 10)  // results in the string "     Hello"
/// ```
///
/// - Parameters:
///     - s: The string to be prefixed.
///     - length: The final length of the result after padding.
///
/// - Returns: The string prefixed with spaces.
func leftPad(s: String, length: Int) -> String {
    var result = s
    while result.count < length {
        result = " " + result
    }
    return result
}

@main
public enum levenshtein {
    public static func main() {
        let pairs: [[String]] = [
            ["Mayor", "Major"],
            ["Heaven", "Hell"],
            ["Green", "Blue"],
            ["Hat", "Fedora"],
            ["Lemon", "Barque"],
        ]
        print()
        print("  1st Word   2nd Word   Distance")
        print("--------------------------------")
        for pair in pairs {
            let d = levenshteinDistance(s1: pair[0], s2: pair[1])
            let first = leftPad(s: pair[0], length: 10)
            let second = leftPad(s: pair[1], length: 10)
            let output = String(format: "%@ %@ %10d", first, second, d)
            print(output)
        }
        print()
    }
}
