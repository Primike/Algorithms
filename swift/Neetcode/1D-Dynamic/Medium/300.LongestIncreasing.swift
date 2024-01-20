// Given an integer array nums, return the length of the longest strictly increasing subsequence

// Time: O(n^2), Space: O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var tab = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] { tab[i] = max(tab[i], tab[j] + 1) }
        }
    }

    return tab.max() ?? 0
}

print(lengthOfLIS([10,9,2,5,3,7,101,18]))
print(lengthOfLIS([0,1,0,3,2,3]))
print(lengthOfLIS([7,7,7,7,7,7,7]))


func lengthOfLIS(_ nums: [Int]) -> Int {
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i == 0 { return 1 }
        if let value = memo[i] { return value }

        var longest = 1

        for j in 0..<i {
            if nums[j] < nums[i] { longest = max(longest, dp(j) + 1) }
        }

        memo[i] = longest
        return longest
    }

    let result = (0..<nums.count).map { dp($0) }
    return result.max() ?? 1
}
