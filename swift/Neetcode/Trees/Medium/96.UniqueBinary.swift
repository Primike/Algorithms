// Given an integer n, return the number of structurally unique BST's 
// (binary search trees) which has exactly n nodes of unique values from 1 to n.

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

print(numTrees(3))
print(numTrees(1))