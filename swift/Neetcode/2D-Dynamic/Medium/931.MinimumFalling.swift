// Given an n x n array of integers matrix, return the 
// minimum sum of any falling path through matrix.
// A falling path starts at any element in the first row and chooses 
// the element in the next row that is either directly below or 
// diagonally left/right. Specifically, the next element from 
// position (row, col) will be (row + 1, col - 1), (row + 1, col), 
// or (row + 1, col + 1).

// Time: O(n^2), Space: O(n^2)
func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    var tab = matrix

    for i in 1..<tab.count {
        for j in 0..<tab[0].count {
            tab[i][j] = tab[i - 1][j]
            if j > 0 { tab[i][j] = min(tab[i][j], tab[i - 1][j - 1]) }
            if j < tab[0].count - 1 { tab[i][j] = min(tab[i][j], tab[i - 1][j + 1]) }
            
            tab[i][j] += matrix[i][j]
        }
    }

    return tab[tab.count - 1].min() ?? 0
}

print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
print(minFallingPathSum([[-19,57],[-40,-5]]))


func minFallingPathSum2(_ matrix: [[Int]]) -> Int {
    let n = matrix.count
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if let value = memo[key] { return value }

        var minimum = Int.max

        if i < n - 1 {
            minimum = min(minimum, dp(i + 1, j))

            if j < n - 1 { minimum = min(minimum, dp(i + 1, j + 1)) }
            if j > 0 { minimum = min(minimum, dp(i + 1, j - 1)) }
        }

        minimum = minimum == .max ? 0 : minimum
        minimum += matrix[i][j]

        memo[key] = minimum
        return minimum
    }

    var result = Int.max

    for j in 0..<n {
        result = min(result, dp(0, j))
    }

    return result
}