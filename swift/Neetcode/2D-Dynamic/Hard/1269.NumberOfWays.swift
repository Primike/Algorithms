// You have a pointer at index 0 in an array of size arrLen. 
// At each step, you can move 1 position to the left, 
// 1 position to the right in the array, or stay in the same place 
// (The pointer should not be placed outside the array at any time).
// Given two integers steps and arrLen, return the number of ways 
// such that your pointer is still at index 0 after exactly steps steps. 

// Time: O(steps * arrLen), Space: O(steps * arrLen)
func numWays(_ steps: Int, _ arrLen: Int) -> Int {
    let mod = 1_000_000_007
    let maxPosition = min(steps, arrLen - 1)
    var tab = Array(repeating: Array(repeating: 0, count: maxPosition + 1), count: steps + 1)
    tab[0][0] = 1

    for j in 1...steps {
        for i in 0...maxPosition {
            tab[j][i] = tab[j - 1][i] % mod
            if i > 0 { tab[j][i] = (tab[j][i] + tab[j - 1][i - 1]) % mod }
            if i < maxPosition { tab[j][i] = (tab[j][i] + tab[j - 1][i + 1]) % mod }
        }
    }

    return tab[steps][0] % mod
}

print(numWays(3, 2))
print(numWays(2, 4))
print(numWays(4, 2))


func numWays2(_ steps: Int, _ arrLen: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ i: Int, _ steps: Int) -> Int {
        let key = "\(i),\(steps)"

        if i == arrLen || i == -1 { return 0 }
        if steps == 0 { return i == 0 ? 1 : 0 }
        if let value = memo[key] { return value }

        var result = dp(i, steps - 1) % mod
        result = (result + dp(i - 1, steps - 1)) % mod
        result = (result + dp(i + 1, steps - 1)) % mod
        
        memo[key] = result
        return result
    }

    return dp(0, steps)
}