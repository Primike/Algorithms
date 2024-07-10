// Return the maximum number of connecting lines we can draw.

// Needleman-Wunsch Algorithm 
// Time: O(m * n), Space: O(m)
func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var tab = Array(repeating: 0, count: nums2.count)

    for i in 0..<nums1.count {
        var nextRow = Array(repeating: 0, count: nums2.count)

        for j in 0..<nums2.count {
            if nums1[i] == nums2[j] {
                nextRow[j] = 1
                if j > 0 { nextRow[j] += tab[j - 1] }
            } else {
                nextRow[j] = tab[j]
                if j > 0 { nextRow[j] = max(nextRow[j], nextRow[j - 1]) }
            }
        }

        tab = nextRow
    }

    return tab[tab.count - 1]
}

print(maxUncrossedLines([1,4,2], [1,2,4]))
print(maxUncrossedLines([2,5,1,2,5], [10,5,2,1,5,2]))
print(maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1]))


func maxUncrossedLines2(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var tab = Array(repeating: Array(repeating: 0, count: nums2.count), count: nums1.count)

    for i in 0..<nums1.count {
        for j in 0..<nums2.count {
            if nums1[i] == nums2[j] { 
                tab[i][j] += 1
                if i > 0, j > 0 { tab[i][j] += tab[i - 1][j - 1] }
            } else {
                if i > 0 { tab[i][j] = max(tab[i][j], tab[i - 1][j]) }
                if j > 0 { tab[i][j] = max(tab[i][j], tab[i][j - 1]) }
            }
        }
    }

    return tab[nums1.count - 1][nums2.count - 1]
}

func maxUncrossedLines3(_ nums1: [Int], _ nums2: [Int]) -> Int {
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