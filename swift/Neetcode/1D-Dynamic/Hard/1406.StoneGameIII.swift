// Alice and Bob take turns, with Alice starting first. On each player's turn, 
// that player can take 1, 2, or 3 stones from the first remaining stones in the row.
// Return "Alice" if Alice will win, "Bob" if Bob will win, or "Tie" 
// if they will end the game with the same score.

// Time: O(n), Space: O(n)
func stoneGameIII(_ stoneValue: [Int]) -> String {
    var tab = Array(repeating: Int.min, count: stoneValue.count + 1)
    tab[tab.count - 1] = 0
    
    for i in (0..<stoneValue.count).reversed() {
        var current = 0

        for j in i..<min(stoneValue.count, i + 3) {
            current += stoneValue[j]
            tab[i] = max(tab[i], current - tab[j + 1])
        }
    }

    if tab[0] > 0 { return "Alice" }
    if tab[0] < 0 { return "Bob" }

    return "Tie"
}

print(stoneGameIII([1,2,3,7]))
print(stoneGameIII([1,2,3,-9]))
print(stoneGameIII([1,2,3,6]))


func stoneGameIII(_ stoneValue: [Int]) -> String {
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if index == stoneValue.count { return 0 }
        if let value = memo[index] { return value }

        var result = Int.min
        var current = 0

        for i in index..<min(stoneValue.count, index + 3) {
            current += stoneValue[i]
            result = max(result, current - dp(i + 1))
        }

        memo[index] = result
        return result
    }

    let points = dp(0)

    if points > 0 { return "Alice" }
    if points < 0 { return "Bob" }
    
    return "Tie"
}