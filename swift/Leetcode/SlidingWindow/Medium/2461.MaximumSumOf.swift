// You are given an integer array nums and an integer k. 
// Find the maximum subarray sum of all the subarrays of 
// nums that meet the following conditions:
// The length of the subarray is k, and
// All the elements of the subarray are distinct.
// Return the maximum subarray sum of all the subarrays that 
// meet the conditions. If no subarray meets the conditions, return 0.

func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
    var dict = [Int: Int]()
    var singles = 0
    var result = 0
    var sum = 0

    for (i, number) in nums.enumerated() {
        dict[number, default: 0] += 1
        if dict[number]! == 1 {
            singles += 1
        } else if dict[number]! == 2 {
            singles -= 1
        }

        sum += number

        if i >= k {
            let removed = nums[i - k]
            dict[removed]! -= 1
            sum -= removed
            
            if dict[removed]! == 1 {
                singles += 1
            } else if dict[removed]! == 0 {
                singles -= 1
                dict.removeValue(forKey: removed)
            }
        }

        if i >= k - 1, singles == k { result = max(result, sum) }
    }

    return result
}

print(maximumSubarraySum([1,5,4,2,9,9,9], 3))
print(maximumSubarraySum([4,4,4], 3))