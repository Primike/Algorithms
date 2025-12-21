class Solution {
    func maxProfit(_ prices: [Int], _ strategy: [Int], _ k: Int) -> Int {
        let n = prices.count
        var profitSum = Array(repeating: 0, count: n + 1)
        var priceSum = Array(repeating: 0, count: n + 1)

        for i in 0..<n {
            profitSum[i + 1] = profitSum[i] + prices[i] * strategy[i]
            priceSum[i + 1] = priceSum[i] + prices[i]
        }

        var res = profitSum[n]

        for i in (k - 1)..<n {
            let leftProfit = profitSum[i - k + 1]
            let rightProfit = profitSum[n] - profitSum[i + 1]
            let changeProfit = priceSum[i + 1] - priceSum[i - k / 2 + 1]
            res = max(res, leftProfit + changeProfit + rightProfit)
        }

        return res
    }
}