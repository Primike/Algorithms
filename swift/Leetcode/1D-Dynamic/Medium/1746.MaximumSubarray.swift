// You are given an integer array nums. You must perform exactly 
// one operation where you can replace one element nums[i] with nums[i] * nums[i]. 
// Return the maximum possible subarray sum after exactly one operation. 
// The subarray must be non-empty.

func maxSumAfterOperation(_ nums: [Int]) -> Int {
    let n = nums.count

    var dp = Array(repeating: [0, 0], count: n)

    dp[0][0] = nums[0]
    dp[0][1] = nums[0] * nums[0]

    var maxSum = dp[0][1]

    for index in 1..<n {
        dp[index][0] = max(nums[index], dp[index - 1][0] + nums[index])

        dp[index][1] = max(
            max(nums[index] * nums[index], dp[index - 1][0] + nums[index] * nums[index]),
            dp[index - 1][1] + nums[index]
        )

        maxSum = max(maxSum, dp[index][1])
    }

    return maxSum
}

print(maxSumAfterOperation([2,-1,-4,-3]))
print(maxSumAfterOperation([1,-1,1,1,-1,-1,1]))