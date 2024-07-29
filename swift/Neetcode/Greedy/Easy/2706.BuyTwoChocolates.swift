// You must buy exactly two chocolates in such a way that you 
// still have some non-negative leftover money. 
// You would like to minimize the sum of the prices of the two chocolates you buy.
// Return the amount of money you will have leftover after buying the two chocolates. 
// If there is no way for you to buy two chocolates without ending up in debt, return money. 

// Time: O(n), Space: O(1)
func buyChoco(_ prices: [Int], _ money: Int) -> Int {
    if prices.count < 2 { return money }
    
    var smallest = Int.max, secondSmallest = Int.max

    for price in prices {
        if price < smallest {
            secondSmallest = min(secondSmallest, smallest)
            smallest = price
        } else if price < secondSmallest {
            secondSmallest = price
        }
    }

    let cost = smallest + secondSmallest
    return money - (cost > money ? 0 : cost)
}

print(buyChoco([1,2,2], 3))
print(buyChoco([3,2,3], 3))