// You have n dice, and each die has k faces numbered from 1 to k.
// Given three integers n, k, and target, return the number of possible ways 
// (out of the kn total ways) to roll the dice, so the sum of the 
// face-up numbers equals target. Since the answer may be too large, 
// return it modulo 109 + 7.

func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ current: Int) -> Int {
        let key = "\(i),\(current)"

        if let value = memo[key] { return value }
        if current == target, i == n { return 1 }
        if current > target || i == n { return 0 }

        var result = 0

        for j in 1...k {
            result += dp(i + 1, current + j)
        }


        result = result % (Int(pow(10, 9.0) + 7))
        memo[key] = result
        return result
    }

    return dp(0, 0)
}

print(numRollsToTarget(1, 6, 3))
print(numRollsToTarget(2, 6, 7))
print(numRollsToTarget(30, 30, 500))