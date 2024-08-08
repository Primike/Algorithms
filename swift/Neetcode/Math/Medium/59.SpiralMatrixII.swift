// Given a positive integer n, generate an n x n matrix 
// filled with elements from 1 to n2 in spiral order.

// Time: O(n^2), Space: O(n^2)
func generateMatrix(_ n: Int) -> [[Int]] {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var i = 0, j = 0
    var number = 1
    var dr = 0

    while number <= n * n {
        result[i][j] = number
        number += 1

        let r = i + directions[dr].0
        let c = j + directions[dr].1

        if r < 0 || r >= n || c < 0 || c >= n || result[r][c] != 0 {
            dr = (dr + 1) % 4
        }

        i += directions[dr].0
        j += directions[dr].1
    }

    return result
}

print(generateMatrix(3))
print(generateMatrix(1))