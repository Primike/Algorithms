class Solution {
    func minimumCost(_ source: String, _ target: String, _ original: [String], _ changed: [String], _ cost: [Int]) -> Int {
        let n = source.count
        let m = original.count
        let INF = Int(1e18)
        let INF_INT = Int(1e9)

        var child = [Array(repeating: -1, count: 26)]
        var tid = [-1]
        var idx = -1

        func newNode() -> Int {
            child.append(Array(repeating: -1, count: 26))
            tid.append(-1)
            return child.count - 1
        }

        func add(_ word: String) -> Int {
            var node = 0
            for ch in word {
                let c = Int(ch.asciiValue! - 97)
                var nxt = child[node][c]
                if nxt == -1 {
                    nxt = newNode()
                    child[node][c] = nxt
                }
                node = nxt
            }
            if tid[node] == -1 {
                idx += 1
                tid[node] = idx
            }
            return tid[node]
        }

        var edgeData = [(Int, Int, Int)]()
        for i in 0..<m {
            let x = add(original[i])
            let y = add(changed[i])
            edgeData.append((x, y, cost[i]))
        }

        let pCount = idx + 1
        if pCount == 0 {
            return source == target ? 0 : -1
        }

        var dist = Array(repeating: Array(repeating: INF_INT, count: pCount), count: pCount)
        for i in 0..<pCount {
            dist[i][i] = 0
        }
        for (x, y, w) in edgeData {
            if w < dist[x][y] {
                dist[x][y] = w
            }
        }

        for k in 0..<pCount {
            for i in 0..<pCount {
                if dist[i][k] == INF_INT { continue }
                for j in 0..<pCount {
                    let nd = dist[i][k] + dist[k][j]
                    if nd < dist[i][j] {
                        dist[i][j] = nd
                    }
                }
            }
        }

        var dp = Array(repeating: INF, count: n + 1)
        dp[0] = 0

        let sArr = source.map { Int($0.asciiValue! - 97) }
        let tArr = target.map { Int($0.asciiValue! - 97) }
        let sChars = Array(source)
        let tChars = Array(target)

        for j in 0..<n {
            if dp[j] >= INF { continue }

            let base = dp[j]
            if sChars[j] == tChars[j] {
                dp[j + 1] = min(dp[j + 1], base)
            }

            var u = 0
            var v = 0
            for i in j..<n {
                u = child[u][sArr[i]]
                v = child[v][tArr[i]]
                if u == -1 || v == -1 { break }
                
                let uid = tid[u]
                let vid = tid[v]
                if uid != -1 && vid != -1 {
                    let w = dist[uid][vid]
                    if w != INF_INT {
                        dp[i + 1] = min(dp[i + 1], base + w)
                    }
                }
            }
        }

        let ans = dp[n]
        return ans >= INF ? -1 : ans
    }
}