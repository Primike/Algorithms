class Solution {
    func maxBuilding(_ n: Int, _ restrictions: [[Int]]) -> Int {
        var r = restrictions
        r.append([1, 0])
        r.sort { $0[0] < $1[0] }
        
        if r.last![0] != n {
            r.append([n, n - 1])
        }
        
        let m = r.count
        
        for i in 1..<m {
            r[i][1] = min(r[i][1], r[i - 1][1] + (r[i][0] - r[i - 1][0]))
        }
        
        for i in stride(from: m - 2, through: 0, by: -1) {
            r[i][1] = min(r[i][1], r[i + 1][1] + (r[i + 1][0] - r[i][0]))
        }
        
        var ans = 0
        for i in 0..<(m - 1) {
            let best = ((r[i + 1][0] - r[i][0]) + r[i][1] + r[i + 1][1]) / 2
            ans = max(ans, best)
        }
        
        return ans
    }
}