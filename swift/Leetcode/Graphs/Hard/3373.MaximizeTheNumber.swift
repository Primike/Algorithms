class Solution {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]]) -> [Int] {
        func dfs(_ node: Int, _ parent: Int, _ depth: Int, _ children: [[Int]], _ color: inout [Int]) -> Int {
            var res = 1 - depth % 2
            color[node] = depth % 2
            for child in children[node] {
                if child == parent {
                    continue
                }
                res += dfs(child, node, depth + 1, children, &color)
            }
            return res
        }

        func build(_ edges: [[Int]], _ color: inout [Int]) -> [Int] {
            let n = edges.count + 1
            var children = Array(repeating: [Int](), count: n)
            for edge in edges {
                let u = edge[0]
                let v = edge[1]
                children[u].append(v)
                children[v].append(u)
            }
            let res = dfs(0, -1, 0, children, &color)
            return [res, n - res]
        }

        let n = edges1.count + 1
        let m = edges2.count + 1
        var color1 = Array(repeating: 0, count: n)
        var color2 = Array(repeating: 0, count: m)
        let count1 = build(edges1, &color1)
        let count2 = build(edges2, &color2)
        var res = Array(repeating: 0, count: n)
        for i in 0..<n {
            res[i] = count1[color1[i]] + max(count2[0], count2[1])
        }
        return res
    }
}