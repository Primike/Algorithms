// You are given an integer array nums and an integer k. 
// Find the maximum subarray sum of all the subarrays of 
// nums that meet the following conditions:
// The length of the subarray is k, and
// All the elements of the subarray are distinct.
// Return the maximum subarray sum of all the subarrays that 
// meet the conditions. If no subarray meets the conditions, return 0.

// Time: O(n), Space: O(n)
func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
    var dict = [Int: Int]()
    var result = 0
    var sum = 0
    var left = 0

    for i in 0..<nums.count {
        dict[nums[i], default: 0] += 1
        sum += nums[i]

        while dict[nums[i], default: 1] > 1 || i - left + 1 >= k {
            if i - left + 1 == k, dict.keys.count == k { result = max(result, sum) }
            dict[nums[left], default: 1] -= 1
            if dict[nums[left]] == 0 { dict[nums[left]] = nil }
            sum -= nums[left]
            left += 1
        }
    }

    return result
}

print(maximumSubarraySum([1,5,4,2,9,9,9], 3))
print(maximumSubarraySum([4,4,4], 3))