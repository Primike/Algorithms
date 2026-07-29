import Foundation

class Solution {
    func findMaxPathScore(_ edges: [[Int]], _ online: [Bool], _ k: Int) -> Int {
        let n = online.count
        var g = Array(repeating: [(v: Int, w: Int)](), count: n)
        var deg = Array(repeating: 0, count: n)
        var l = Int.max
        var r = 0

        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let w = edge[2]
            
            if !online[u] || !online[v] { continue }
            g[u].append((v: v, w: w))
            deg[v] += 1
            l = min(l, w)
            r = max(r, w)
        }

        var q = [Int]()
        for i in 1..<n {
            if deg[i] == 0 {
                q.append(i)
            }
        }
        
        var head = 0
        while head < q.count {
            let u = q[head]
            head += 1
            for edge in g[u] {
                deg[edge.v] -= 1
                if edge.v != 0 && deg[edge.v] == 0 {
                    q.append(edge.v)
                }
            }
        }

        func check(_ mid: Int) -> Bool {
            var dp = Array(repeating: Int.max, count: n)
            var cdeg = deg
            dp[0] = 0

            var checkQ = [0]
            var checkHead = 0
            
            while checkHead < checkQ.count {
                let u = checkQ[checkHead]
                checkHead += 1
                
                if u == n - 1 {
                    return dp[u] <= k
                }

                for edge in g[u] {
                    if edge.w >= mid {
                        if dp[u] != Int.max {
                            dp[edge.v] = min(dp[edge.v], dp[u] + edge.w)
                        }
                    }
                    cdeg[edge.v] -= 1
                    if cdeg[edge.v] == 0 {
                        checkQ.append(edge.v)
                    }
                }
            }
            return false
        }

        if !check(l) {
            return -1
        }

        while l <= r {
            let mid = (l + r) >> 1
            if check(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return r
    }
}