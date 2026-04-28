class UnionFind {
    var parent: [Int]
    var size: [Int]
    var setCount: Int

    init(_ n: Int) {
        self.parent = Array(0..<n)
        self.size = Array(repeating: 1, count: n)
        self.setCount = n
    }

    func findset(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = findset(parent[x])
        return parent[x]
    }

    func unite(_ x: Int, _ y: Int) {
        var rootX = x
        var rootY = y
        if size[rootX] < size[rootY] {
            (rootX, rootY) = (rootY, rootX)
        }
        parent[rootY] = rootX
        size[rootX] += size[rootY]
        setCount -= 1
    }

    func findAndUnite(_ x: Int, _ y: Int) -> Bool {
        let parentX = findset(x)
        let parentY = findset(y)
        if parentX != parentY {
            unite(parentX, parentY)
            return true
        }
        return false
    }
}

class Solution {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        let uf = UnionFind(m * n)

        for i in 0..<m {
            for j in 0..<n {
                if i > 0 && grid[i][j] == grid[i - 1][j] {
                    if !uf.findAndUnite(i * n + j, (i - 1) * n + j) {
                        return true
                    }
                }
                if j > 0 && grid[i][j] == grid[i][j - 1] {
                    if !uf.findAndUnite(i * n + j, i * n + j - 1) {
                        return true
                    }
                }
            }
        }
        return false
    }
}