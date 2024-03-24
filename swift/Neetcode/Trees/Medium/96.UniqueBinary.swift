// Given an integer n, return the number of structurally unique BST's 
// (binary search trees) which has exactly n nodes of unique values from 1 to n.

// Time: O(n), Space: O(1)
func numTrees(_ n: Int) -> Int {
    var catalan = 1

    for i in 0..<n {
        catalan = catalan * 2 * (2 * i + 1) / (i + 2)
    }

    return catalan
}

print(numTrees(3))
print(numTrees(1))


// Time: O(n^2), Space: O(n)
func numTrees(_ n: Int) -> Int {
    if n <= 1 { return 1 }

    var tab = Array(repeating: 0, count: n + 1)
    tab[0] = 1
    tab[1] = 1

    for i in 2...n {
        for j in 0..<i {
            tab[i] += tab[j] * tab[i - j - 1]
        }
    }

    return tab[n]
}

func numTrees2(_ n: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ left: Int, _ right: Int) -> Int {
        let key = "\(left),\(right)"

        if left >= right { return 1 }
        if let value = memo[key] { return value }

        var result = 0

        for i in left...right {
            result += dp(left, i - 1) * dp(i + 1, right)
        }

        memo[key] = result
        return result
    }

    return dp(1, n)
}