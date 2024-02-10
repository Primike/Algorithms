// You are given n balloons, indexed from 0 to n - 1. Each balloon is 
// painted with a number on it represented by an array nums. 
// You are asked to burst all the balloons.
// If you burst the ith balloon, you will get nums[i - 1] * nums[i] * nums[i + 1] 
// coins. If i - 1 or i + 1 goes out of bounds of the array, 
// then treat it as if there is a balloon with a 1 painted on it.
// Return the maximum coins you can collect by bursting the balloons wisely.

func maxCoins(_ nums: [Int]) -> Int {
    let nums = [1] + nums + [1]
    var memo = [[Int]: Int]()

    func dp(_ left: Int, _ right: Int) -> Int {
        let key = [left, right]

        if left + 1 == right { return 0 }
        if let value = memo[key] { return value }

        var result = 0

        for i in (left + 1)..<right {
            let coins = nums[left] * nums[i] * nums[right] 
            let total = coins + dp(left, i) + dp(i, right) 
            result = max(result, total)
        }

        memo[key] = result
        return result
    }

    return dp(0, nums.count - 1)
}

print(maxCoins([3,1,5,8]))
print(maxCoins([1,5]))