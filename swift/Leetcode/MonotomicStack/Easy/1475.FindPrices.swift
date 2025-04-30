// You are given an integer array prices where prices[i] 
// is the price of the ith item in a shop.
// There is a special discount for items in the shop. 
// If you buy the ith item, then you will receive a discount 
// equivalent to prices[j] where j is the minimum index such that 
// j > i and prices[j] <= prices[i]. Otherwise, 
// you will not receive any discount at all.
// Return an integer array answer where answer[i] is the 
// final price you will pay for the ith item of the shop, 
// considering the special discount.

// Time: O(n), Space: O(n)
func finalPrices(_ prices: [Int]) -> [Int] {
    var result = prices
    var monotomic = [(Int, Int)]()

    for j in 0..<prices.count {
        while let (i, last) = monotomic.last, last >= prices[j] {
            result[i] = last - prices[j]
            monotomic.removeLast()
        }

        monotomic.append((j, prices[j]))
    }

    return result
}

print(finalPrices([8,4,6,2,3]))
print(finalPrices([1,2,3,4,5]))
print(finalPrices([10,1,1,6]))