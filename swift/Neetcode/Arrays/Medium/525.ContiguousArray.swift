// Given a binary array nums, return the maximum length 
// of a contiguous subarray with an equal number of 0 and 1.

// Time: O(n), Space: O(n)
func findMaxLength(_ nums: [Int]) -> Int {
    var sumToIndex = [0: -1]
    var result = 0
    var sum = 0

    for (i, number) in nums.enumerated() {
        sum += number == 1 ? 1 : -1

        if let index = sumToIndex[sum] { result = max(result, i - index) }
        if !sumToIndex.keys.contains(sum) { sumToIndex[sum] = i }
    }

    return result
}

print(findMaxLength([0,1]))
print(findMaxLength([0,1,0]))