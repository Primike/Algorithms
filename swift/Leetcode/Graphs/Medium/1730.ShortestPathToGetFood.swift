// '*' is your location. There is exactly one '*' cell.
// '#' is a food cell. There may be multiple food cells.
// 'O' is free space, and you can travel through these cells.
// 'X' is an obstacle, and you cannot travel through these cells.
// Return the length of the shortest path for you to reach any food cell. 
// If there is no path for you to reach food, return -1.

// Time: O(m * n), Space: O(m * n)
func getFood(_ grid: [[Character]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var queue = [(Int, Int)]()

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == "*" { queue = [(i, j)] }
        }
    }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set([[queue[0].0, queue[0].1]])
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            
            for (di, dj) in directions {
                let r = i + di, c = j + dj
                let key = [r, c]

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }
                if visited.contains(key) || grid[r][c] == "X" { continue }  
                if grid[r][c] == "#" { return result + 1 }
                
                visited.insert(key)
                queue.append((r, c))
            }
        }

        result += 1
    }

    return -1
}

print(getFood([
    ["X","X","X","X","X","X"],["X","*","O","O","O","X"],
    ["X","O","O","#","O","X"],["X","X","X","X","X","X"]]))
print(getFood([
    ["X","X","X","X","X"],["X","*","X","O","X"],
    ["X","O","X","#","X"],["X","X","X","X","X"]]))
print(getFood([
    ["X","X","X","X","X","X","X","X"],["X","*","O","X","O","#","O","X"],
    ["X","O","O","X","O","O","X","X"],["X","O","O","O","O","#","O","X"],
    ["X","X","X","X","X","X","X","X"]]))