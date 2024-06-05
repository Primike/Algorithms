// Given an m x n matrix, return all elements of the matrix in spiral order.

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let rows = matrix.count, cols = matrix[0].count
    var visited = Set<[Int]>()
    var result = [Int]()
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)] 

    func dfs(_ i: Int, _ j: Int, _ current: Int) {
        if i < 0 || i >= rows || j < 0 || j >= cols { return }
        if visited.contains([i, j]) { return }

        result.append(matrix[i][j])
        visited.insert([i, j])

        let r = i + directions[current].0
        let c = j + directions[current].1

        if r < 0 || r >= rows || c < 0 || c >= cols || visited.contains([r, c]) {
            let index = (current + 1) % 4
            dfs(i + directions[index].0, j + directions[index].1, index)
        } else {
            dfs(r, c, current)
        }
    }

    dfs(0, 0, 0)
    return result
}

print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))