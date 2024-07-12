// Given an integer n, return how many distinct 
// phone numbers of length n we can dial.
// You are allowed to place the knight on 
// any numeric cell initially and then you should perform
//  n - 1 jumps to dial a number of length n. 
//  All jumps should be valid knight jumps.

// Time: O(n), Space: O(n)
func knightDialer(_ n: Int) -> Int {
    let mod = 1_000_000_007
    var paths = [[4, 6], [6, 8], [7, 9], [4, 8], [0, 3, 9],
    [], [0, 1, 7], [2, 6], [1, 3], [2, 4]]
    var tab = Array(repeating: Array(repeating: 0, count: 10), count: n)

    for i in 0..<10 {
        tab[0][i] = 1
    }

    for i in 1..<n {
        for j in 0..<10 {
            for next in paths[j] {
                tab[i][next] = (tab[i][next] + tab[i - 1][j]) % mod
            }
        }
    }

    var result = 0

    for i in 0..<10 {
        result = (result + tab[n - 1][i]) % mod
    }

    return result
}

print(knightDialer(1))
print(knightDialer(2))
print(knightDialer(3131))


func knightDialer(_ n: Int) -> Int {
    let mod = 1_000_000_007
    var paths = [[4, 6], [6, 8], [7, 9], [4, 8], [0, 3, 9],
    [], [0, 1, 7], [2, 6], [1, 3], [2, 4]]
    var memo = [String: Int]()

    func dp(_ node: Int, _ digits: Int) -> Int {
        let key = "\(node),\(digits)"

        if digits == n { return 1 }
        if node == 5 { return 0 }
        if let value = memo[key] { return value }

        var count = 0

        for next in paths[node] {
            count += (dp(next, digits + 1) % mod)
        }

        count %= mod
        memo[key] = count
        return count
    }

    var result = 0
    
    for i in 0..<paths.count {
        result += (dp(i, 1) % mod)
    }

    return result % mod
}