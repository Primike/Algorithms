// A number x is considered missing if x is in the range 
// [lower, upper] and x is not in nums.
// Return the shortest sorted list of ranges that exactly covers 
// all the missing numbers. That is, no element of nums is included in any 
// of the ranges, and each missing number is covered by one of the ranges.

// Time: O(n), Space: O(n)
func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
    if nums.count == 0 { return [[lower, upper]] } 

    var result = [[Int]]()

    if nums[0] != lower { result.append([lower, nums[0] - 1]) }

    for i in 1..<nums.count {
        if nums[i] - 1 == nums[i - 1] { continue }

        result.append([nums[i - 1] + 1, nums[i] - 1])
    }

    if nums[nums.count - 1] != upper { 
        result.append([nums[nums.count - 1] + 1, upper])
    }

    return result
}

print(findMissingRanges([0,1,3,50,75], 0, 99))
print(findMissingRanges([-1], -1, -1))