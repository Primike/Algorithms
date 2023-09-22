// Given an integer n, return the least number of perfect square numbers that sum to n.

func numSquares(_ n: Int) -> Int {
    var tab = Array(repeating: Int.max, count: n + 1)
    tab[0] = 0
    let limit = Int(sqrt(Double(n))) + 1

    for n in 0..<n {
        for i in 1..<limit {
            let index = n + i * i

            if index < tab.count { tab[index] = min(tab[index], tab[n] + 1) }
        }
    }

    return tab[tab.count - 1]
}

print(numSquares(12))
print(numSquares(13))