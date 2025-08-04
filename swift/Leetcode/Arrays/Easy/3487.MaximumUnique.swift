// You are given an integer array nums.
// You are allowed to delete any number of elements from nums 
// without making it empty. After performing the deletions, 
// select a subarray of nums such that:
// All elements in the subarray are unique.
// The sum of the elements in the subarray is maximized.
// Return the maximum sum of such a subarray.

// Time: O(n), Space: O(n)
func maxSum(_ nums: [Int]) -> Int {
    let positives = nums.filter { $0 > 0 }
    if positives.count == 0 { return nums.max() ?? 0 }
    return Array(Set(positives)).reduce(0, +)
}

print(maxSum([1,2,3,4,5]))
print(maxSum([1,1,0,1,1]))
print(maxSum([1,2,-1,-2,1,0,-1]))