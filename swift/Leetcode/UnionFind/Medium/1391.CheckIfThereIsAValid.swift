class Solution {
    class DisjointSet {
        var parent: [Int]

        init(_ n: Int) {
            parent = Array(0..<n)
        }

        func find(_ x: Int) -> Int {
            if parent[x] == x {
                return x
            }
            parent[x] = find(parent[x])
            return parent[x]
        }

        func merge(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            if rootX != rootY {
                parent[rootX] = rootY
            }
        }
    }

    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        let patterns = [0, 0b1010, 0b0101, 0b1100, 0b0110, 0b1001, 0b0011]
        let dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        let ds = DisjointSet(m * n)

        func getId(_ x: Int, _ y: Int) -> Int {
            return x * n + y
        }

        for i in 0..<m {
            for j in 0..<n {
                let pattern = patterns[grid[i][j]]
                for (k, dir) in dirs.enumerated() {
                    if (pattern & (1 << k)) > 0 {
                        let ni = i + dir.0
                        let nj = j + dir.1
                        
                        if ni >= 0 && ni < m && nj >= 0 && nj < n {
                            let neighborPattern = patterns[grid[ni][nj]]
                            let reciprocalDir = (k + 2) % 4
                            if (neighborPattern & (1 << reciprocalDir)) > 0 {
                                ds.merge(getId(i, j), getId(ni, nj))
                            }
                        }
                    }
                }
            }
        }

        return ds.find(getId(0, 0)) == ds.find(getId(m - 1, n - 1))
    }
}