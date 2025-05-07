// Given a zero-based permutation nums (0-indexed), 
// build an array ans of the same length where ans[i] = nums[nums[i]] 
// for each 0 <= i < nums.length and return it.
// A zero-based permutation nums is an array of distinct integers 
// from 0 to nums.length - 1 (inclusive).

// Time: O(n), Space: O(n)
func buildArray(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)

    for i in 0..<nums.count {
        result[i] = nums[nums[i]]
    }

    return result
}

print(buildArray([0,2,1,5,3,4]))
print(buildArray([5,0,1,2,3,4]))