// Return the number of combinations that make up that amount. 
// If that amount of money cannot be made up by any combination of the coins, return 0.

func change(_ amount: Int, _ coins: [Int]) -> Int {
    if amount < 1 { return 1 }
    
    var tab = Array(repeating: 0, count: amount + 1)
    tab[0] = 1

    for coin in coins {
        for i in 1...amount {
            if i - coin >= 0 {
                tab[i] += tab[i - coin]
            }
        }
    }

    return tab[amount]
}

print(change(5, [1,2,5]))
print(change(3, [2]))
print(change(10, [10]))