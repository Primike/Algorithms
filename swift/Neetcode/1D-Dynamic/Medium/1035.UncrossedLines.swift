// Return the maximum number of connecting lines we can draw.

func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)

    for i in 1...nums1.count {
        for j in 1...nums2.count {
            if nums1[i - 1] == nums2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }

    return dp[nums1.count][nums2.count]
}


print(maxUncrossedLines([1,4,2], [1,2,4]))
print(maxUncrossedLines([2,5,1,2,5], [10,5,2,1,5,2]))
print(maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1]))


func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == nums1.count || j == nums2.count { return 0 }
        if let value = memo[key] { return value }

        if nums1[i] == nums2[j] {
            memo[key] = 1 + dp(i + 1, j + 1)
        } else {
            memo[key] = max(dp(i + 1, j), dp(i, j + 1))
        }

        return memo[key, default: 0]
    }

    return dp(0, 0)
}
