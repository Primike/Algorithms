class LCA {
    let n: Int
    let m: Int
    var e: [[Int]]
    var d: [Int]
    var f: [[Int]]
    
    init(edges: [[Int]], root: Int = 1) {
        self.n = edges.count + 1
        self.m = Int(log2(Double(n))) + 2
        self.e = Array(repeating: [Int](), count: n + 1)
        self.d = Array(repeating: 0, count: n + 1)
        self.f = Array(repeating: Array(repeating: 0, count: m), count: n + 1)
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            e[u].append(v)
            e[v].append(u)
        }
        
        dfs(root, 0)
        
        for i in 1..<m {
            for x in 1...n {
                f[x][i] = f[f[x][i - 1]][i - 1]
            }
        }
    }
    
    private func dfs(_ x: Int, _ fa: Int) {
        f[x][0] = fa
        for y in e[x] {
            if y == fa { continue }
            d[y] = d[x] + 1
            dfs(y, x)
        }
    }
    
    func lca(_ x: Int, _ y: Int) -> Int {
        var x = x
        var y = y
        
        if d[x] > d[y] {
            let temp = x
            x = y
            y = temp
        }
        
        let diff = d[y] - d[x]
        for i in stride(from: m - 1, through: 0, by: -1) {
            if (diff & (1 << i)) != 0 {
                y = f[y][i]
            }
        }
        
        if x == y { return x }
        
        for i in stride(from: m - 1, through: 0, by: -1) {
            if f[x][i] != f[y][i] {
                x = f[x][i]
                y = f[y][i]
            }
        }
        
        return f[x][0]
    }
    
    func dis(_ x: Int, _ y: Int) -> Int {
        return d[x] + d[y] - d[lca(x, y)] * 2
    }
}

class Solution {
    private let mod = 1_000_000_007
    private static let maxN = 100_010
    private static var p2: [Int] = {
        var array = Array(repeating: 0, count: maxN)
        array[0] = 1
        for i in 1..<maxN {
            array[i] = (array[i - 1] * 2) % 1_000_000_007
        }
        return array
    }()
    
    func assignEdgeWeights(_ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        let lca = LCA(edges: edges, root: 1)
        let m = queries.count
        var res = Array(repeating: 0, count: m)
        
        for i in 0..<m {
            let x = queries[i][0]
            let y = queries[i][1]
            if x != y {
                res[i] = Solution.p2[lca.dis(x, y) - 1]
            }
        }
        
        return res
    }
}