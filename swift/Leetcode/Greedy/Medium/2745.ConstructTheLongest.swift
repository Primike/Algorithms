// You have x strings equal to "AA", y strings equal to "BB", 
// and z strings equal to "AB". You want to choose some (possibly all or none) 
// of these strings and concatenate them in some order to form a new string. 
// This new string must not contain "AAA" or "BBB" as a substring.
// Return the maximum possible length of the new string.

// Time: O(1), Space: O(1)
func longestString(_ x: Int, _ y: Int, _ z: Int) -> Int {
    let startA = x > y ? (2 * y) + 1 : 2 * x
    let startB = y > x ? (2 * x) + 1 : 2 * y

    return (max(startA, startB) + z) * 2
}

print(longestString(2, 5, 1))
print(longestString(3, 2, 2))