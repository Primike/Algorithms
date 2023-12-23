// You are given an array prices where prices[i] is the price of a given stock on the ith day.
// After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).

func maxProfit(_ prices: [Int]) -> Int {        
    var hold = Array(repeating: Int.min, count: prices.count)
    var sell = Array(repeating: 0, count: prices.count)
    var rest = Array(repeating: 0, count: prices.count)
    hold[0] = -prices[0]

    for i in 1..<prices.count {
        hold[i] = max(hold[i - 1], rest[i - 1] - prices[i])
        sell[i] = hold[i - 1] + prices[i]
        rest[i] = max(rest[i - 1], sell[i - 1])
    }
    
    return max(sell[prices.count - 1], rest[prices.count - 1])
}

print(maxProfit([1,2,3,0,2]))
print(maxProfit([1]))


func maxProfit2(_ prices: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ isBuying: Bool) -> Int {
        let key = "\(i),\(isBuying)"

        if i >= prices.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, isBuying)

        if isBuying {
            result = max(result, dp(i + 1, !isBuying) - prices[i])
        } else {
            result = max(result, dp(i + 2, !isBuying) + prices[i])
        }

        memo[key] = result
        return result
    }

    return dp(0, true)
}
