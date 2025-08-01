// The score of an array is defined as the product of its sum and its length.
// For example, the score of [1, 2, 3, 4, 5] is (1 + 2 + 3 + 4 + 5) * 5 = 75.
// Given a positive integer array nums and an integer k, return the number 
// of non-empty subarrays of nums whose score is strictly less than k.
// A subarray is a contiguous sequence of elements within an array.

// Time: O(n), Space: O(1)
func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var sum = 0
    var left = 0

    for i in 0..<nums.count {
        sum += nums[i]

        while left <= i, sum * (i - left + 1) >= k {
            sum -= nums[left]
            left += 1
        }

        result += i - left + 1
    }

    return result
}

print(countSubarrays([2,1,4,3,5], 10))
print(countSubarrays([1,1,1], 5))