//You are given an integer array prices where prices[i] is 
//the price of a given stock on the ith day.
//Find and return the maximum profit you can achieve.

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0

    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            profit += prices[i] - prices[i - 1]
        }
    }

    return profit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([1,2,3,4,5]))
print(maxProfit([7,6,4,3,1]))