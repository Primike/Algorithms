class Solution {
    func calc(_ a: Int, _ b: Int, _ c: Int) -> Int {
        return max(a, b, c) - min(a, b, c)
    }

    func minimumScore(_ nums: [Int], _ edges: [[Int]]) -> Int {
        let n = nums.count
        var adj = Array(repeating: [Int](), count: n)

        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }

        var cnt = 0
        var sumXor = Array(repeating: 0, count: n)
        var tin = Array(repeating: 0, count: n)
        var tout = Array(repeating: 0, count: n)

        func dfs(x: Int, fa: Int) {
            tin[x] = cnt
            cnt += 1
            sumXor[x] = nums[x]
            for y in adj[x] {
                if y == fa {
                    continue
                }
                dfs(x: y, fa: x)
                sumXor[x] ^= sumXor[y]
            }
            tout[x] = cnt
        }

        dfs(x: 0, fa: -1)

        var res = Int.max
        for u in 1..<n {
            for v in (u + 1)..<n {
                if tin[v] > tin[u] && tin[v] < tout[u] {
                    let a = sumXor[0] ^ sumXor[u]
                    let b = sumXor[u] ^ sumXor[v]
                    let c = sumXor[v]
                    res = min(res, self.calc(a, b, c))
                } else if tin[u] > tin[v] && tin[u] < tout[v] {
                    let a = sumXor[0] ^ sumXor[v]
                    let b = sumXor[v] ^ sumXor[u]
                    let c = sumXor[u]
                    res = min(res, self.calc(a, b, c))
                } else {
                    let a = sumXor[0] ^ sumXor[u] ^ sumXor[v]
                    let b = sumXor[u]
                    let c = sumXor[v]
                    res = min(res, self.calc(a, b, c))
                }
            }
        }
        return res
    }
}