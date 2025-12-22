class Solution {
    func maxProfit(_ n: Int, _ present: [Int], _ future: [Int], _ hierarchy: [[Int]], _ budget: Int) -> Int {
        var g = [[Int]](repeating: [], count: n)
        for e in hierarchy {
            g[e[0] - 1].append(e[1] - 1)
        }

        func dfs(_ u: Int) -> ([Int], [Int], Int) {
            let cost = present[u]
            let dCost = present[u] / 2
            
            var subProfit0 = [Int](repeating: 0, count: budget + 1)
            var subProfit1 = [Int](repeating: 0, count: budget + 1)
            var uSize = cost

            for v in g[u] {
                let (child_dp0, child_dp1, vSize) = dfs(v)
                uSize += vSize
                for i in stride(from: budget, through: 0, by: -1) {
                    for sub in 0...min(vSize, i) {
                        subProfit0[i] = max(
                            subProfit0[i],
                            subProfit0[i - sub] + child_dp0[sub]
                        )
                        subProfit1[i] = max(
                            subProfit1[i],
                            subProfit1[i - sub] + child_dp1[sub]
                        )
                    }
                }
            }

            var dp0 = [Int](repeating: 0, count: budget + 1)
            var dp1 = [Int](repeating: 0, count: budget + 1)

            for i in 0...budget {
                dp0[i] = subProfit0[i]
                dp1[i] = subProfit0[i]
                if i >= dCost {
                    dp1[i] = max(
                        dp1[i],
                        subProfit1[i - dCost] + future[u] - dCost
                    )
                }
                if i >= cost {
                    dp0[i] = max(
                        dp0[i],
                        subProfit1[i - cost] + future[u] - cost
                    )
                }
            }

            return (dp0, dp1, uSize)
        }

        return dfs(0).0[budget]
    }
}