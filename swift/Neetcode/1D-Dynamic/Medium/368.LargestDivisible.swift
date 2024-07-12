// Given a set of distinct positive integers nums, 
// return the largest subset answer such that every pair 
// (answer[i], answer[j]) of elements in this subset satisfies:
// answer[i] % answer[j] == 0, or
// answer[j] % answer[i] == 0
// If there are multiple solutions, return any of them.

// Time: O(n^2), Space: O(n)
func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
    let nums = nums.sorted()
    var tab = Array(repeating: [Int](), count: nums.count)
    
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] % nums[j] == 0 {
                if tab[i].count < tab[j].count { tab[i] = tab[j] }
            }
        }

        tab[i].append(nums[i])
    }

    return tab.max { $0.count < $1.count } ?? []
}

print(largestDivisibleSubset([1,2,3]))
print(largestDivisibleSubset([1,2,4,8]))


func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
    let nums = nums.sorted { $0 > $1 }
    var memo = [String: [Int]]()

    func dp(_ i: Int, _ last: Int) -> [Int] {
        let key = "\(i),\(last)"

        if i == nums.count { return [] }
        if let value = memo[key] { return value }

        var result = dp(i + 1, last)

        if last % nums[i] == 0 { 
            let take = [nums[i]] + dp(i + 1, nums[i])
            if result.count < take.count { result = take }
        }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}