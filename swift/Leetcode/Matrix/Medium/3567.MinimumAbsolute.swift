class Solution {
    func minAbsDiff(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        var res = Array(repeating: Array(repeating: 0, count: n - k + 1), count: m - k + 1)
        
        for i in 0..<(m - k + 1) {
            for j in 0..<(n - k + 1) {
                var kgrid: [Int] = []
                for x in i..<(i + k) {
                    for y in j..<(j + k) {
                        kgrid.append(grid[x][y])
                    }
                }
                
                kgrid.sort()
                var kmin = Int.max
                
                for t in 1..<kgrid.count {
                    if kgrid[t] == kgrid[t - 1] {
                        continue
                    }
                    kmin = min(kmin, kgrid[t] - kgrid[t - 1])
                }
                
                if kmin != Int.max {
                    res[i][j] = kmin
                }
            }
        }
        
        return res
    }
}