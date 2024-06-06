// You have n dice, and each die has k faces numbered from 1 to k.
// Given three integers n, k, and target, return the number of possible ways 
// (out of the kn total ways) to roll the dice, so the sum of the 
// face-up numbers equals target. Since the answer may be too large, 
// return it modulo 109 + 7.

// Time: O(n * k * target), Space: O(n * target)
func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: Array(repeating: 0, count: target + 1), count: n + 1)
    tab[0][0] = 1

    for r in 1...n {
        for c in 1...target {
            for i in 1...min(k, c) {
                tab[r][c] = (tab[r][c] + tab[r - 1][c - i]) % mod
            }
        }
    }

    return tab[n][target]
}

print(numRollsToTarget(1, 6, 3))
print(numRollsToTarget(2, 6, 7))
print(numRollsToTarget(30, 30, 500))


func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ n: Int, _ target: Int) -> Int {
        let key = "\(n),\(target)"

        if target == 0, n == 0 { return 1 }
        if target == 0 || n == 0 { return 0 }
        if let value = memo[key] { return value }

        var result = 0

        for i in 1...k {
            if target - i < 0 { break }
            result += dp(n - 1, target - i)
        }

        result %= 1_000_000_007
        memo[key] = result 
        return result
    }

    return dp(n, target)
}