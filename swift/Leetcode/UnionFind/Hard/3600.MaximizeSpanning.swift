class DSU {
    var parent: [Int]

    init(_ parent: [Int]) {
        self.parent = parent
    }

    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = find(parent[x])
        return parent[x]
    }

    func join(_ x: Int, _ y: Int) {
        let px = find(x)
        let py = find(y)
        if px != py {
            parent[px] = py
        }
    }
}

class Solution {
    private let maxStabilityVal = 200000

    func maxStability(_ n: Int, _ edges: [[Int]], _ k: Int) -> Int {
        var ans = -1

        if edges.count < n - 1 {
            return -1
        }

        let mustEdges = edges.filter { $0[3] == 1 }
        let optionalEdges = edges.filter { $0[3] != 1 }.sorted { $0[2] > $1[2] }

        if mustEdges.count > n - 1 {
            return -1
        }

        var selectedInit = 0
        var mustMinStability = maxStabilityVal
        let dsuInit = DSU(Array(0..<n))

        for edge in mustEdges {
            let u = edge[0], v = edge[1], s = edge[2]
            if dsuInit.find(u) == dsuInit.find(v) || selectedInit == n - 1 {
                return -1
            }
            dsuInit.join(u, v)
            selectedInit += 1
            mustMinStability = min(mustMinStability, s)
        }

        var l = 0
        var r = mustMinStability

        while l < r {
            let mid = l + ((r - l + 1) >> 1)
            let dsu = DSU(dsuInit.parent)
            var selected = selectedInit
            var doubledCount = 0

            for edge in optionalEdges {
                if selected == n - 1 { break }
                
                let u = edge[0], v = edge[1], s = edge[2]
                if dsu.find(u) == dsu.find(v) {
                    continue
                }

                if s >= mid {
                    dsu.join(u, v)
                    selected += 1
                } else if doubledCount < k && s * 2 >= mid {
                    doubledCount += 1
                    dsu.join(u, v)
                    selected += 1
                }
            }

            if selected != n - 1 {
                r = mid - 1
            } else {
                ans = mid
                l = mid
            }
        }

        return ans
    }
}