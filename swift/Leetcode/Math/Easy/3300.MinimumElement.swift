// You are given an integer array nums.
// You replace each element in nums with the sum of its digits.
// Return the minimum element in nums after all replacements.

// Time: O(n * log10(n)), Space: O(1)
func minElement(_ nums: [Int]) -> Int {
    var result = Int.max

    for i in 0..<nums.count {
        var current = nums[i]
        var sum = 0

        while current > 0 {
            sum += current % 10
            current /= 10
        }

        result = min(result, sum)
    }

    return result
}

print(minElement([10,12,13,14]))
print(minElement([1,2,3,4]))
print(minElement([999,19,199]))