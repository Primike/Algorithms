// nums.length == 2 * n.
// nums contains n + 1 unique elements.
// Exactly one element of nums is repeated n times.
// Return the element that is repeated n times.

// Time: O(n), Space: O(n)
func repeatedNTimes(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let mostCommon = dict.values.max() ?? 0

    for (key, value) in dict {
        if value == mostCommon { return key }
    }

    return 0
}

print(repeatedNTimes([1,2,3,3]))
print(repeatedNTimes([2,1,2,5,3,2]))
print(repeatedNTimes([5,1,5,2,5,3,5,4]))