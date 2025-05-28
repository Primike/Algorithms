class Solution {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]], _ k: Int) -> [Int] {
        func dfs(node: Int, parent: Int, children: [[Int]], k: Int) -> Int {
            if k < 0 {
                return 0
            }
            var res = 1
            for child in children[node] {
                if child == parent {
                    continue
                }
                res += dfs(node: child, parent: node, children: children, k: k - 1)
            }
            return res
        }

        func build(edges: [[Int]], k: Int) -> [Int] {
            let n = edges.count + 1
            var children = [[Int]](repeating: [Int](), count: n)
            for edge in edges {
                let u = edge[0]
                let v = edge[1]
                children[u].append(v)
                children[v].append(u)
            }
            var res = [Int](repeating: 0, count: n)
            for i in 0..<n {
                res[i] = dfs(node: i, parent: -1, children: children, k: k)
            }
            return res
        }

        let n = edges1.count + 1
        let count1 = build(edges: edges1, k: k)
        let count2 = build(edges: edges2, k: k - 1)
        let maxCount2 = count2.max() ?? 0
        var res = [Int](repeating: 0, count: n)
        for i in 0..<n {
            res[i] = count1[i] + maxCount2
        }
        return res
    }
}