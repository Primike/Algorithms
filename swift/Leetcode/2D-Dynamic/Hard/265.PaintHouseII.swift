func minCostII(_ costs: [[Int]]) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ k: Int) -> Int {
        let key = "\(index),\(k)"

        if index == costs.count { return 0 }
        if let value = memo[key] { return value }

        var result = Int.max

        for i in 0..<costs[index].count {
            if i == k { continue }
            result = min(result, dp(index + 1, i) + costs[index][i])
        }

        memo[key] = result
        return result
    }

    return dp(0, -1)
}