class Solution {
    func rotateGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        let nLayer = min(m / 2, n / 2)

        for layer in 0..<nLayer {
            var r = [Int]()
            var c = [Int]()
            var val = [Int]()

            for i in layer..<(m - layer - 1) {
                r.append(i)
                c.append(layer)
                val.append(grid[i][layer])
            }
            
            for j in layer..<(n - layer - 1) {
                r.append(m - layer - 1)
                c.append(j)
                val.append(grid[m - layer - 1][j])
            }
            
            for i in stride(from: m - layer - 1, to: layer, by: -1) {
                r.append(i)
                c.append(n - layer - 1)
                val.append(grid[i][n - layer - 1])
            }
            
            for j in stride(from: n - layer - 1, to: layer, by: -1) {
                r.append(layer)
                c.append(j)
                val.append(grid[layer][j])
            }

            let total = val.count
            let kk = k % total
            
            if kk == 0 { continue }

            for i in 0..<total {
                let idx = (i + total - kk) % total
                grid[r[i]][c[i]] = val[idx]
            }
        }
        
        return grid
    }
}