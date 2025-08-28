class Solution {
    func lenOfVDiagonal(_ grid: [[Int]]) -> Int {
        let dirs = [(1, 1), (1, -1), (-1, -1), (-1, 1)]
        let m = grid.count
        let n = grid[0].count

        struct State: Hashable {
            let cx: Int
            let cy: Int
            let direction: Int
            let turn: Bool
            let target: Int
        }
        var cache = [State: Int]()

        var dfs: ((Int, Int, Int, Bool, Int) -> Int)!
        dfs = { (cx, cy, direction, turn, target) in
            let state = State(cx: cx, cy: cy, direction: direction, turn: turn, target: target)
            if let cachedResult = cache[state] {
                return cachedResult
            }

            let nx = cx + dirs[direction].0
            let ny = cy + dirs[direction].1

            if nx < 0 || ny < 0 || nx >= m || ny >= n || grid[nx][ny] != target {
                return 0
            }

            var maxStep = dfs(nx, ny, direction, turn, 2 - target)

            if turn {
                maxStep = max(
                    maxStep,
                    dfs(nx, ny, (direction + 1) % 4, false, 2 - target)
                )
            }
            
            let result = maxStep + 1
            cache[state] = result
            return result
        }

        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    for direction in 0..<4 {
                        res = max(res, dfs(i, j, direction, true, 2) + 1)
                    }
                }
            }
        }
        
        return res
    }
}