// Given an array of integers nums and an integer k, 
// return the number of contiguous subarrays where the product 
// of all the elements in the subarray is strictly less than k.

// Time: O(n), Space: O(1)
func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k <= 1 { return 0 }

    var result = 0
    var left = 0
    var product = 1

    for i in 0..<nums.count {
        product *= nums[i]

        while product >= k {
            product /= nums[left]
            left += 1
        }

        result += i - left + 1
    }

    return result
}

print(numSubarrayProductLessThanK([10,5,2,6], 100))
print(numSubarrayProductLessThanK([1,2,3], 0))