// Return the maximum number of connecting lines we can draw.

// Time: O(m * n), Space: O(m * n)
func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let n1 = nums1.count, n2 = nums2.count
    var dp = Array(repeating: Array(repeating: 0, count: n2 + 1), count: n1 + 1)

    for i in 1..<dp.count {
        for j in 1..<dp[0].count {
            if nums1[i - 1] == nums2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }

    return dp[n1][n2]
}


print(maxUncrossedLines([1,4,2], [1,2,4]))
print(maxUncrossedLines([2,5,1,2,5], [10,5,2,1,5,2]))
print(maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1]))


func maxUncrossedLines2(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i == nums1.count || j == nums2.count { return 0 }
        if let value = memo[key] { return value }

        var result = 0

        if nums1[i] == nums2[j] {
            result = 1 + dp(i + 1, j + 1)
        } else {
            result = max(dp(i + 1, j), dp(i, j + 1))
        }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}