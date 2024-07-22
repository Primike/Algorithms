// There is a group of n members, and a list of various crimes they could commit. 
// The ith crime generates a profit[i] and requires group[i] members to participate in it. 
// If a member participates in one crime, that member can't participate in another crime.
// Let's call a profitable scheme any subset of these crimes that generates at least 
// minProfit profit, and the total number of members 
// participating in that subset of crimes is at most n.
// Return the number of schemes that can be chosen.

// Time: O(n * p * i), Space: O(n * p * i)
func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ n: Int, _ cash: Int, _ i: Int) -> Int {
        let key = "\(n),\(cash),\(i)"

        if n == 0 { return cash >= minProfit ? 1 : 0 }
        if i == group.count { return cash >= minProfit ? 1 : 0 }
        if let value = memo[key] { return value }

        var result = dp(n, cash, i + 1) % mod
        
        if n >= group[i] { 
            result += (dp(n - group[i], min(cash + profit[i], minProfit), i + 1) % mod) 
        }

        result %= mod
        memo[key] = result
        return result
    }

    return dp(n, 0, 0)
}

print(profitableSchemes(5, 3, [2,2], [2,3]))
print(profitableSchemes(10, 5, [2,3,5], [6,7,8]))