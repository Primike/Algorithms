// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. 
// In how many distinct ways can you climb to the top?

func climbStairs(_ n: Int) -> Int {
    var one = 1, two = 1

    for _ in 0..<(n - 1) {
        var number = one
        one = one + two
        two = number
    }

    return one
}

print(climbStairs(2))
print(climbStairs(3))

func climbStairs2(_ n: Int) -> Int {
    var memo = [Int: Int]()

    func recursive(_ n: Int) -> Int {
        if let count = memo[n] { return count }
        if n == 0 { return 1 }
        if n < 0 { return 0 }

        memo[n] = recursive(n - 1) + recursive(n - 2)
        return memo[n] ?? 0
    }

    return recursive(n)
}
