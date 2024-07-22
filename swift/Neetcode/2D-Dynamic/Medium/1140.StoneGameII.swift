// Alice and Bob take turns, with Alice starting first.  Initially, M = 1.
// On each player's turn, that player can take all the stones in the first 
// X remaining piles, where 1 <= X <= 2M.  Then, we set M = max(M, X).
// Assuming Alice and Bob play optimally, 
// return the maximum number of stones Alice can get.

// Time: O(n^3), Space: O(n^2)
func stoneGameII(_ piles: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ m: Int, _ isAlice: Bool) -> Int {
        let key = "\(index),\(m),\(isAlice)"

        if index == piles.count { return 0 }
        if let value = memo[key] { return value }

        var result = isAlice ? 0 : Int.max
        var current = 0

        for i in index..<min(piles.count, index + m * 2) {
            current += piles[i]

            if isAlice {
                result = max(result, dp(i + 1, max(m, i - index + 1), false) + current)
            } else {
                result = min(result, dp(i + 1, max(m, i - index + 1), true))
            }
        }

        memo[key] = result
        return result
    }

    return dp(0, 1, true)
}

print(stoneGameII([2,7,9,4,4]))
print(stoneGameII([1,2,3,4,5,100]))