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
    
    if s1.isEmpty{
        return s1.count
    }
    if s2.isEmpty{
        return s2.count
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

@main
public struct levenshtein {
    public static func main() {
        let pairs: [[String]] = [
            ["Kaserne", "Kaverne"],
            ["Himmel", "Hölle"],
            ["Grün", "Blau"],
            ["Hut", "Donaudampfschiffahrtskapitänsmütze"],
            ["Zitrone", "Dampfschiff"]
        ]

        for pair in pairs{
            print("The Levenshtein distance between", pair[0], "and", pair[1], "is",
                levenshteinDistance(s1: pair[0], s2: pair[1]), ".")
        }
    }
}
