// Your task is to find the maximum difference 
// diff = freq(a1) - freq(a2) between the frequency of characters 
// a1 and a2 in the string such that:
// a1 has an odd frequency in the string.
// a2 has an even frequency in the string.
// Return this maximum difference.

// Time: O(n), Space: O(26)
func maxDifference(_ s: String) -> Int {
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let maxOdd = dict.values.filter { $0 % 2 != 0 }.max() ?? 0
    let minEven = dict.values.filter { $0 % 2 == 0 }.min() ?? 0
    
    return maxOdd - minEven
}

print(maxDifference("aaaaabbc"))
print(maxDifference("abcabcab"))