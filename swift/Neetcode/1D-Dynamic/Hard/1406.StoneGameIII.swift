// Alice and Bob take turns, with Alice starting first. On each player's turn, 
// that player can take 1, 2, or 3 stones from the first remaining stones in the row.
// Return "Alice" if Alice will win, "Bob" if Bob will win, or "Tie" 
// if they will end the game with the same score.

func stoneGameIII(_ stoneValue: [Int]) -> String {
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if index >= stoneValue.count { return 0 }
        if let value = memo[index] { return value }

        var points = Int.min
        var sum = 0

        for i in 0..<3 {
            if index + i < stoneValue.count {
                sum += stoneValue[index + i]
                points = max(points, sum - dp(index + i + 1))
            }
        }

        memo[index] = points
        return points
    }

    let result = dp(0)
    
    if result > 0 {
        return "Alice"
    } else if result < 0 {
        return "Bob"
    } else {
        return "Tie"
    }
}

print(stoneGameIII([1,2,3,7]))
print(stoneGameIII([1,2,3,-9]))
print(stoneGameIII([1,2,3,6]))