// Given an integer n, return the least number of perfect square numbers that sum to n.

// Time: O(n^2), Space: O(n)
func numSquares(_ n: Int) -> Int {
    var squares = [Int]()
    var current = 1

    while current * current <= n {
        squares.append(current * current)
        current += 1
    }

    var tab = Array(repeating: Int.max, count: n + 1)
    tab[0] = 0

    for i in 0..<tab.count {
        if tab[i] == .max { continue }

        for square in squares {
            if i + square < tab.count {
                tab[i + square] = min(tab[i + square], tab[i] + 1)
            }
        }
    }

    return tab[n] == .max ? 0 : tab[n]
}

print(numSquares(12))
print(numSquares(13))


// For loop makes it faster
func numSquares2(_ n: Int) -> Int {
    var squares = [Int]()
    var current = 1

    while current * current <= n {
        squares.append(current * current)
        current += 1
    }
    
    var memo = [Int: Int]()

    func dp(_ target: Int) -> Int {
        if target == 0 { return 0 }
        if target < 0 { return Int.max }
        if let value = memo[target] { return value }

        var minimum = Int.max

        for square in squares {
            let take = dp(target - square)

            if take != Int.max { minimum = min(minimum, take + 1) }
        }

        memo[target] = minimum
        return minimum
    }

    let result = dp(n)
    return result == Int.max ? -1 : result
}