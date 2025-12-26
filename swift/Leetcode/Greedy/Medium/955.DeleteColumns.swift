class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs.count
        let m = strs[0].count
        let grid = strs.map { Array($0) }
        var cuts = Array(repeating: false, count: n - 1)
        var ans = 0

        for j in 0..<m {
            var isSorted = true
            for i in 0..<n - 1 {
                if !cuts[i] && grid[i][j] > grid[i + 1][j] {
                    isSorted = false
                    break
                }
            }

            if isSorted {
                for i in 0..<n - 1 {
                    if grid[i][j] < grid[i + 1][j] {
                        cuts[i] = true
                    }
                }
            } else {
                ans += 1
            }
        }

        return ans
    }
}