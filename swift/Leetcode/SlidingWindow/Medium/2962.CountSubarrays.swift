// You are given an integer array nums and a positive integer k.
// Return the number of subarrays where the maximum element of nums 
// appears at least k times in that subarray.

// Time: O(n), Space: O(1)
func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
    let target = nums.max() ?? 0
    var result = 0
    var count = 0
    var left = 0

    for (i, number) in nums.enumerated() {
        if number == target { count += 1 }
        
        while left <= i, count == k {
            result += nums.count - i
            
            if nums[left] == target { count -= 1 }
            left += 1
        }
    }

    return result
}

print(countSubarrays([1,3,2,3,3], 2))
print(countSubarrays([1,4,2,1], 3))