class UnionFind {
    private var parent: [Int]
    private var rank: [Int]

    init(_ n: Int) {
        parent = Array(0..<n)
        rank = Array(repeating: 0, count: n)
    }

    func find(_ x: Int) -> Int {
        var root = x
        while parent[root] != root {
            parent[root] = parent[parent[root]]
            root = parent[root]
        }
        return root
    }

    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        if rootX == rootY { return }

        if rank[rootX] < rank[rootY] {
            parent[rootX] = rootY
        } else if rank[rootX] > rank[rootY] {
            parent[rootY] = rootX
        } else {
            parent[rootY] = rootX
            rank[rootX] += 1
        }
    }
}

class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let n = source.count
        let uf = UnionFind(n)

        for swap in allowedSwaps {
            uf.union(swap[0], swap[1])
        }

        var rootToIndices = [Int: [Int]]()
        for i in 0..<n {
            let root = uf.find(i)
            rootToIndices[root, default: []].append(i)
        }

        var totalMatches = 0
        for indices in rootToIndices.values {
            var frequencies = [Int: Int]()
            
            for idx in indices {
                frequencies[source[idx], default: 0] += 1
            }
            
            for idx in indices {
                let val = target[idx]
                if let count = frequencies[val], count > 0 {
                    totalMatches += 1
                    frequencies[val] = count - 1
                }
            }
        }

        return n - totalMatches
    }
}