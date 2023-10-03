// Given the two integers m and n, return the number of possible unique 
// paths that the robot can take to reach the bottom-right corner.

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var tab = Array(repeating: Array(repeating: 0, count: n), count: m)
    tab[0][0] = 1 

    for i in 0..<m {
        for j in 0..<n {
            let current = tab[i][j]

            if i + 1 < m { tab[i + 1][j] += current }
            if j + 1 < n { tab[i][j + 1] += current }
        }
    }

    return tab[m - 1][n - 1]
}

print(uniquePaths(3, 7))
print(uniquePaths(3, 2))