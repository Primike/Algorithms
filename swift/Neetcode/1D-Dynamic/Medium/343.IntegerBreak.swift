// Given an integer n, break it into the sum of k positive integers, 
// where k >= 2, and maximize the product of those integers.
// Return the maximum product you can get.

// Time: O(n), Space: O(n)
func integerBreak(_ n: Int) -> Int {
    var tab = Array(repeating: 0, count: n + 1)
    tab[1] = 1

    for i in 2...n {
        for j in 1..<i {
            tab[i] = max(tab[i], max(j * (i - j), j * tab[i - j]))
        }
    }

    return tab[n]
}

print(integerBreak(2))
print(integerBreak(10))


func integerBreak2(_ n: Int) -> Int {    
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if n <= 3 { return n }
        if let value = memo[n] { return value}

        var result = n

        for i in 2..<n {
            result = max(result, dp(n - i) * i)
        }

        memo[n] = result
        return result
    }

    return dp(n)
}

func integerBreak3(_ n: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if n == 0 { return 1 }
        if n < 0 { return 0 }
        if let value = memo[n] { return value}

        var result = 0

        for i in 1..<n {
            result = max(result, max(dp(n - i) * i, i * (n - i)))
        }

        memo[n] = result
        return result
    }

    return dp(n)
}