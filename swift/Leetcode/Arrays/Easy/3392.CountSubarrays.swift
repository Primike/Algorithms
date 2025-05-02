// Given an integer array nums, return the number of 
// subarrays of length 3 such that the sum of the 
// first and third numbers equals exactly half of the second number.

// Time: O(n), Space: O(1)
func countSubarrays(_ nums: [Int]) -> Int {
    var result = 0

    for i in 1..<(nums.count - 1) {
        if 2 * (nums[i - 1] + nums[i + 1]) == nums[i] { 
            result += 1
        }
    }

    return result
}

print(countSubarrays([1,2,1,4,1]))
print(countSubarrays([1,1,1]))