// Return the number of combinations that make up that amount. 
// If that amount of money cannot be made up by any combination of the coins, return 0.

func change(_ amount: Int, _ coins: [Int]) -> Int {
    var tab = Array(repeating: 0, count: amount + 1)
    tab[0] = 1

    for coin in coins {
        for i in 0..<amount {            
            if i + coin <= amount { tab[i + coin] += tab[i] }
        }
    }

    return tab[amount]
}

print(change(5, [1,2,5]))
print(change(3, [2]))
print(change(10, [10]))


func change2(_ amount: Int, _ coins: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ current: Int) -> Int {
        let key = "\(index),\(current)"

        if index >= coins.count || current > amount { return 0 }
        if let value = memo[key] { return value }
        if current == amount { return 1 }

        var result = 0

        for i in index..<coins.count {
            result += dp(i, current + coins[i])
        }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}
