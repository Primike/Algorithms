// You are painting a fence of n posts with k different colors. 
// You must paint the posts following these rules:
// Every post must be painted exactly one color.
// There cannot be three or more consecutive posts with the same color.
// Given the two integers n and k, return the number of ways you can paint the fence.

// Time: O(n), Space: O(n)
func numWays(_ n: Int, _ k: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if n == 1 { return k }
        if n == 2 { return k * k }
        if let value = memo[n] { return value }

        var result = (k - 1) * (dp(n - 1) + dp(n - 2))
        
        memo[n] = result
        return result
    }

    return dp(n)
}

print(numWays(3, 2))
print(numWays(1, 1))
print(numWays(7, 2))