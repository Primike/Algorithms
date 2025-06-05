// You are given a 0-indexed array nums of distinct integers.
// Let us define a 0-indexed array ans of the same length 
// as nums in the following way:
// ans[i] is the maximum length of a subarray nums[l..r], 
// such that the maximum element in that subarray is equal to nums[i].
// Return the array ans.
// Note that a subarray is a contiguous part of the array.

// Time: O(n), Space: O(n)
func maximumLengthOfRanges(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 1, count: nums.count)
    var monotomic = [(Int, Int, Int)]()

    for (i, number) in (nums + [Int.max]).enumerated() {
        var streak = 0

        while let last = monotomic.last, last.1 <= number {
            streak += last.2
            result[last.0] = streak
            monotomic.removeLast()
        }

        monotomic.append((i, number, streak + 1))
    }

    return result
}

print(maximumLengthOfRanges([1,5,4,3,6]))
print(maximumLengthOfRanges([1,2,3,4,5]))