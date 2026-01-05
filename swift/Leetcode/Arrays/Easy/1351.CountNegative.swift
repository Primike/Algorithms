class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let rows = grid.count, cols = grid[0].count
        var result = 0

        for i in 0..<rows {
            var left = 0, right = grid[i].count - 1

            while left <= right {
                let mid = (right + left) / 2

                if grid[i][mid] >= 0 {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            if left >= grid[i].count { continue }
            result += grid[i].count - left
        }

        return result
    }
}