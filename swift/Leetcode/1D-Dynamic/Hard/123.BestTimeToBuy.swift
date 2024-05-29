// You are given an array prices where prices[i] 
// is the price of a given stock on the ith day.
// Find the maximum profit you can achieve. 
// You may complete at most two transactions.

// Time: O(n), Space: O(n)
func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
    
    var tabLeft = Array(repeating: 0, count: prices.count)
    var tabRight = Array(repeating: 0, count: prices.count + 1)
    var leftMin = prices[0]
    var rightMax = prices[prices.count - 1]

    for i in 1..<prices.count {
        tabLeft[i] = max(tabLeft[i - 1], prices[i] - leftMin)
        leftMin = min(leftMin, prices[i])

        let j = prices.count - 1 - i
        tabRight[j] = max(tabRight[j + 1], rightMax - prices[j])
        rightMax = max(rightMax, prices[j])
    }

    var result = 0

    for i in 0..<prices.count {
        result = max(result, tabLeft[i] + tabRight[i + 1])
    }

    return result
}