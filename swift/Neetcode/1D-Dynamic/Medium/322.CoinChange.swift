// Return the fewest number of coins that you need to make up that amount. 
// If that amount of money cannot be made up by any combination of the coins, return -1.

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var tab = Array(repeating: Int.max, count: amount + 1)
    tab[0] = 0

    for i in 0..<tab.count {
        if tab[i] == Int.max { continue }

        for coin in coins {
            let index = i + coin

            if index < tab.count { tab[index] = min(tab[index], tab[i] + 1) }
        }
    }

    return tab[amount] == Int.max ? -1 : tab[amount]
}

print(coinChange([1,2,5], 11))
print(coinChange([2], 3))
print(coinChange([1], 0))

func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
    var memo: [Int: Int] = [:]
    
    func dp(_ current: Int) -> Int {
        if current < 0 { return -1 }
        if current == 0 { return 0 }
        if let stored = memo[current] { return stored }
        
        var minimum = Int.max
        
        for coin in coins {
            let result = dp(current - coin)
            
            if result >= 0 {
                minimum = min(minimum, result + 1)
            }
        }
        
        memo[current] = (minimum == Int.max) ? -1 : minimum
        return memo[current]!
    }
    
    return dp(amount)
}