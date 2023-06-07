//You are given an array prices where prices[i] 
//is the price of a given stock on the ith day.
//You want to maximize your profit by choosing a single day to buy one stock 
//and choosing a different day in the future to sell that stock.

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    var minimum = Int.max

    for (i, number) in prices.enumerated() {
        minimum = min(minimum, number)
        profit = max(profit, number - minimum)
    }

    return profit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([7,6,4,3,1]))
print(maxProfit([7,2,5,3,7,1,7,4]))