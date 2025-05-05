//Given an integer array nums and an integer k, 
//return true if nums has a good subarray or false otherwise.
//A good subarray is a subarray where:
//its length is at least two, and
//the sum of the elements of the subarray is a multiple of k.

// Time: O(n), Space: O(min(n, k))
func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    var dict = [0: -1]
    var sum = 0

    for i in 0..<nums.count {
        sum += nums[i]
        let remainder = sum % k

        if let value = dict[remainder], i - value >= 2 { return true }
        if !dict.keys.contains(remainder) { dict[remainder] = i }
    }

    return false
}

print(checkSubarraySum([23,2,4,6,7], 6))
print(checkSubarraySum([23,2,6,4,7], 6))
print(checkSubarraySum([23,2,6,4,7], 13))