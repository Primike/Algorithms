// Alice and Bob take turns, with Alice starting first.  Initially, M = 1.
// On each player's turn, that player can take all the stones in the first 
// X remaining piles, where 1 <= X <= 2M.  Then, we set M = max(M, X).
// Assuming Alice and Bob play optimally, 
// return the maximum number of stones Alice can get.

func stoneGameII(_ piles: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ m: Int, _ isAlice: Bool) -> Int {
        let key = "\(index),\(m),\(isAlice)"

        if index >= piles.count { return 0 }
        if let value = memo[key] { return value }

        var result = isAlice ? 0 : Int.max
        var total = 0

        for i in 1..<(m * 2) + 1 {
            if index + i > piles.count { break }

            total += piles[index + i - 1]

            if isAlice {
                result = max(result, total + dp(index + i, max(m, i), !isAlice))
            } else {
                result = min(result, dp(index + i, max(m, i), !isAlice))
            }
        }

        memo[key] = result
        return result
    }

    return dp(0, 1, true)
}
