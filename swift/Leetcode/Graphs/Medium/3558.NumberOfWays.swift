class Solution {
    private let mod = 1_000_000_007
    
    private func dfs(_ g: [[Int]], _ x: Int, _ f: Int) -> Int {
        var maxDep = 0
        for y in g[x] {
            if y == f { continue }
            maxDep = max(maxDep, dfs(g, y, x) + 1)
        }
        return maxDep
    }
    
    private func power(_ base: Int, _ exp: Int) -> Int {
        var res = 1
        var b = base
        var e = exp
        while e > 0 {
            if e % 2 == 1 { res = (res * b) % mod }
            b = (b * b) % mod
            e /= 2
        }
        return res
    }

    func assignEdgeWeights(_ edges: [[Int]]) -> Int {
        let n = edges.count + 1
        var g = Array(repeating: [Int](), count: n + 1)
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            g[u].append(v)
            g[v].append(u)
        }
        
        let maxDep = dfs(g, 1, 0)
        return power(2, maxDep - 1)
    }
}