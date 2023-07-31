// Given an integer array nums, find the subarray
// with the largest sum, and return its sum.

func maxSubArray(_ nums: [Int]) -> Int {
    var result = Int.min
    var currentSum = 0

    for number in nums {
        if currentSum < 0 {
            currentSum = 0
        } 

        currentSum += number
        result = max(result, currentSum)
    }

    return result
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
print(maxSubArray([1]))
print(maxSubArray([5,4,-1,7,8]))