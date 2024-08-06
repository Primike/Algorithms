// A distinct string is a string that is present only once in an array.
// Given an array of strings arr, and an integer k, 
// return the kth distinct string present in arr. 
// If there are fewer than k distinct strings, return an empty string "".
// Note that the strings are considered in the order 
// in which they appear in the array.

// Time: O(2 * n), Space: O(26)
func kthDistinct(_ arr: [String], _ k: Int) -> String {
    let dict = arr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for letter in arr {
        if dict[letter, default: 0] == 1 {
            if result == k - 1 { return letter } 
            result += 1
        }
    }

    return ""
}

print(kthDistinct(["d","b","c","b","c","a"], 2))
print(kthDistinct(["aaa","aa","a"], 1))
print(kthDistinct(["a","b","a"], 3))