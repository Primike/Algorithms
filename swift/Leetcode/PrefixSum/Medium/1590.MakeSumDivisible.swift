// Given an array of positive integers nums, remove the smallest subarray 
// (possibly empty) such that the sum of the remaining elements is divisible by p. 
// It is not allowed to remove the whole array.
// Return the length of the smallest subarray that you need to remove, 
// or -1 if it's impossible.
// A subarray is defined as a contiguous block of elements in the array.

// Time: O(n), Space: O(n)
func minSubarray(_ nums: [Int], _ p: Int) -> Int {
    let target = nums.reduce(0, +) % p
    if target == 0 { return 0 } 

    var dict = [0: -1]
    var result = Int.max
    var current = 0

    for (i, number) in nums.enumerated() {
        current = (current + number) % p
        let remainder = (current - target + p) % p

        if let value = dict[remainder] { result = min(result, i - value) }

        dict[current] = i
    }

    return result == Int.max || result == nums.count ? -1 : result
}

print(minSubarray([3,1,4,2], 6))
print(minSubarray([6,3,5,2], 9))
print(minSubarray([1,2,3], 3))