// Given an integer array nums, return the length of the longest strictly increasing subsequence

// Time: O(n * log(n)), Space: O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var tab = [Int]()

    for (i, number) in nums.enumerated() {
        var left = 0, right = tab.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if number > tab[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        if left == tab.count {
            tab.append(nums[i])
        } else {
            tab[left] = nums[i]
        }
    }

    return tab.count
}

print(lengthOfLIS([10,9,2,5,3,7,101,18]))
print(lengthOfLIS([0,1,0,3,2,3]))
print(lengthOfLIS([7,7,7,7,7,7,7]))


func lengthOfLIS2(_ nums: [Int]) -> Int {
    var tab = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] { tab[i] = max(tab[i], tab[j] + 1) }
        }
    }

    return tab.max() ?? 0
}

func lengthOfLIS3(_ nums: [Int]) -> Int {
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