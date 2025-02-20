// Given two strings s and part, perform the following operation on 
// s until all occurrences of the substring part are removed:
// Find the leftmost occurrence of the substring part and remove it from s.
// Return s after removing all occurrences of part.

// Time: O(m * n), Space: O(n)
func removeOccurrences(_ s: String, _ part: String) -> String {
    var result = ""
    
    for letter in s {
        result.append(letter)

        if result.hasSuffix(part) { result.removeLast(part.count) }
    }

    return result
}

print(removeOccurrences("daabcbaabcbc", "abc"))
print(removeOccurrences("axxxxyyyyb", "xy"))