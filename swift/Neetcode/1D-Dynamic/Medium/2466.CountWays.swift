// Return the number of different good strings that can be constructed satisfying these properties. 
// Since the answer can be large, return it modulo 109 + 7.

// Time: O(n), Space: O(n)
func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: 0, count: high + 1)
    tab[0] = 1

    for i in 0..<tab.count {
        if i + zero < tab.count { tab[i + zero] += tab[i] % mod }
        if i + one < tab.count { tab[i + one] += tab[i] % mod }
    }

    return Array(tab[low...high]).reduce(0, +) % mod
}

print(countGoodStrings(3, 3, 1, 1))
print(countGoodStrings(2, 3, 1, 2))


func countGoodStrings2(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i > high { return 0 }
        if i == high { return 1 }
        if let value = memo[i] { return value }
        
        var result = i >= low ? 1 : 0
        result += (dp(i + zero) + dp(i + one)) % mod

        memo[i] = result
        return result
    }

    return dp(0)
}