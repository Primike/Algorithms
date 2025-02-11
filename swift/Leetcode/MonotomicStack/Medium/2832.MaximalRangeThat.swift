// You are given a 0-indexed array nums of distinct integers.
// Let us define a 0-indexed array ans of the same length 
// as nums in the following way:
// ans[i] is the maximum length of a subarray nums[l..r], 
// such that the maximum element in that subarray is equal to nums[i].
// Return the array ans.
// Note that a subarray is a contiguous part of the array.

// Time: O(n), Space: O(n)
func maximumLengthOfRanges(_ nums: [Int]) -> [Int] {
    var nums = nums + [(nums.max() ?? 0) + 1]
    var result = Array(repeating: 1, count: nums.count - 1)
    var monotomic = [(Int, Int)]()

    for i in 0..<nums.count {
        var count = 0

        while let last = monotomic.last, nums[last.0] <= nums[i] {
            monotomic.removeLast()
            result[last.0] = last.1 + i - last.0
            count = i - last.0 + last.1
        }

        monotomic.append((i, count))
    }

    return result
}

print(maximumLengthOfRanges([1,5,4,3,6]))
print(maximumLengthOfRanges([1,2,3,4,5]))