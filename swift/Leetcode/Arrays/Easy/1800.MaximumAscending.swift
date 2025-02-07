// Given an array of positive integers nums, 
// return the maximum possible sum of an ascending subarray in nums.

// Time: O(n), Space: O(1)
func maxAscendingSum(_ nums: [Int]) -> Int {
    var result = nums[0]
    var total = nums[0]

    for i in 1..<nums.count {
        if nums[i] > nums[i - 1] {
            total += nums[i]
        } else {
            total = nums[i]
        }

        result = max(result, total)
    }

    return result
}

print(maxAscendingSum([10,20,30,5,10,50]))
print(maxAscendingSum([10,20,30,40,50]))
print(maxAscendingSum([12,17,15,13,10,11,12]))