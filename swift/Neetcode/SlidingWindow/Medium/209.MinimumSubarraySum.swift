// Given an array of positive integers nums and a positive integer target, 
// return the minimal length of a subarray whose sum is greater than or equal to target. 
// If there is no such subarray, return 0 instead.

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var currentSum = 0, left = 0
    var result = Int.max

    for i in 0..<nums.count {
        currentSum += nums[i]

        while currentSum >= target {
            result = min(result, i - left + 1)
            currentSum -= nums[left]
            left += 1
        }
    }

    return result == Int.max ? 0 : result
}

print(minSubArrayLen(7, [2,3,1,2,4,3]))
print(minSubArrayLen(4, [1,4,4]))
print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))