// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. 
// In how many distinct ways can you climb to the top?

// Time: O(n), Space: O(1)
func climbStairs(_ n: Int) -> Int {
    var previous = 0, current = 1
    
    for _ in 0..<n {
        let temp = current
        current += previous
        previous = temp
    }
    
    return current
}

print(climbStairs(2))
print(climbStairs(3))

func climbStairs2(_ n: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if let value = memo[n] { return value }
        if n == 0 { return 1 }
        if n < 0 { return 0 }

        memo[n] = dp(n - 1) + dp(n - 2)
        return memo[n] ?? 0
    }

    return dp(n)
}