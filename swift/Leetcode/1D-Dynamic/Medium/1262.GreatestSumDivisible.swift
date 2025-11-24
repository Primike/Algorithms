// Given an integer array nums, return the maximum possible sum 
// of elements of the array such that it is divisible by three.

// Time: O(n), Space: O(n)
func maxSumDivThree(_ nums: [Int]) -> Int {
    var memo = [[Int]: Int]()

    func dp(_ i: Int, _ remainder: Int) -> Int {
        let key = [i, remainder]

        if let value = memo[key] { return value }
        if i >= nums.count { return 0 }

        var result = dp(i + 1, remainder)
        let take = dp(i + 1, (remainder + nums[i]) % 3) + nums[i]

        if (take + remainder) % 3 == 0 { result = max(result, take) }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}

print(maxSumDivThree([3,6,5,1,8]))
print(maxSumDivThree([4]))
print(maxSumDivThree([1,2,3,4,4]))