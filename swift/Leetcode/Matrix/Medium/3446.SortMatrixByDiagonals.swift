class Solution {
    func sortMatrix(_ grid: [[Int]]) -> [[Int]] {
        var grid = grid
        let n = grid.count

        for i in 0..<n {
            var tmp = [Int]()
            for j in 0..<(n - i) {
                tmp.append(grid[i + j][j])
            }
            tmp.sort(by: >)
            for j in 0..<(n - i) {
                grid[i + j][j] = tmp[j]
            }
        }

        for j in 1..<n {
            var tmp = [Int]()
            for i in 0..<(n - j) {
                tmp.append(grid[i][j + i])
            }
            tmp.sort()
            for i in 0..<(n - j) {
                grid[i][j + i] = tmp[i]
            }
        }

        return grid
    }
}