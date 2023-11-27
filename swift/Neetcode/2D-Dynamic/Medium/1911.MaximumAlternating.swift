// Given an array nums, return the maximum alternating sum of any subsequence of 
// nums (after reindexing the elements of the subsequence).

func maxAlternatingSum(_ nums: [Int]) -> Int {
    var even = nums[0]
    var odd = 0

    for i in 1..<nums.count {
        let newEven = max(even, odd + nums[i])
        let newOdd = max(odd, even - nums[i])
        
        even = newEven
        odd = newOdd
    }

    return max(even, odd)
}

print(maxAlternatingSum([4,2,5,3]))
print(maxAlternatingSum([5,6,7,8]))
print(maxAlternatingSum([6,2,1,2,4,5]))


func maxAlternatingSum2(_ nums: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ isEven: Bool) -> Int {
        let key = "\(i),\(isEven)"

        if i >= nums.count{ return 0 }
        if let value = memo[key] { return value }

        let skip = dp(i + 1, isEven)
        let take = dp(i + 1, !isEven) + (isEven ? nums[i] : -nums[i])

        var result = max(skip, take)
        memo[key] = result
        return result
    }

    return dp(0, true)
}