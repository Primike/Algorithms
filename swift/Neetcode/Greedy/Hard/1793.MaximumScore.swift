// The score of a subarray (i, j) is defined as 
// min(nums[i], nums[i+1], ..., nums[j]) * (j - i + 1). 
// A good subarray is a subarray where i <= k <= j.
// Return the maximum possible score of a good subarray.

// Time: O(n), Space: O(1)
func maximumScore(_ nums: [Int], _ k: Int) -> Int {
    var result = nums[k]
    var left = k, right = k
    var smallest = nums[k]

    while left > 0 || right < nums.count - 1 {
        if left > 0, (right == nums.count - 1 || nums[left - 1] >= nums[right + 1]) {
            left -= 1
            smallest = min(smallest, nums[left])
        } else {
            right += 1
            smallest = min(smallest, nums[right])
        }
        
        result = max(result, smallest * (right - left + 1))
    }

    return result
}

print(maximumScore([1,4,3,7,4,5], 3))
print(maximumScore([5,5,4,5,4,1,1,1], 0))