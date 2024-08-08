// Given an m x n matrix, return all elements of the matrix in spiral order.

// Time: O(m * n), Space: O(m * n)
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let rows = matrix.count
    let cols = matrix[0].count
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result = [Int]()
    var visited = Set<[Int]>()
    var i = 0, j = 0
    var dr = 0
    
    while result.count < rows * cols {
        result.append(matrix[i][j])
        visited.insert([i, j])
        
        let r = i + directions[dr].0
        let c = j + directions[dr].1
        
        if visited.contains([r, c]) || r < 0 || r >= rows || c < 0 || c >= cols {
            dr = (dr + 1) % 4
        }
        
        i += directions[dr].0
        j += directions[dr].1
    }
    
    return result
}

print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))


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