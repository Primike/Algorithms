// For some 1 <= k <= 6, there is exactly one lowercase and one uppercase 
// letter of the first k letters of the English alphabet in the grid. 
// This means that there is exactly one key for each lock, 
// and one lock for each key; and also that the letters used to represent 
// the keys and locks were chosen in the same order as the English alphabet.
// Return the lowest number of moves to acquire all keys. 
// If it is impossible, return -1.

// Time: O(m * n * 2^k), Space: O(m * n * 2^k)
func shortestPathAllKeys(_ grid: [String]) -> Int {
    let grid = grid.map { Array($0) }
    let rows = grid.count, cols = grid[0].count
    let locks = Set<Character>(["A", "B", "C", "D", "E", "F"])
    var target = [0, 0, 0, 0, 0, 0]
    var queue = [[Int]]()
    
    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j].isLetter, !locks.contains(grid[i][j]) {
                target[Int(grid[i][j].asciiValue!) - 97] = 1
            } else if grid[i][j] == "@" {
                queue.append([i, j, 0, 0, 0, 0, 0, 0])
            }
        }
    }
    
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set([queue[0]])
    var result = 1
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            let i = first[0], j = first[1]
            
            for (di, dj) in directions {
                let r = i + di, c = j + dj

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }

                let cell = grid[r][c]
                var keys = Array(first[2...])
                
                if cell == "#" || visited.contains([r, c] + keys) { continue }
                if locks.contains(cell), keys[Int(cell.asciiValue!) - 65] != 1 { continue }
                if cell.isLowercase { keys[Int(cell.asciiValue!) - 97] = 1 }
                if keys == target { return result }
                
                visited.insert([r, c] + keys)
                queue.append([r, c] + keys)
            }
        }
        
        result += 1
    }
    
    return -1
}

print(shortestPathAllKeys(["@.a..","###.#","b.A.B"]))
print(shortestPathAllKeys(["@..aA","..B#.","....b"]))
print(shortestPathAllKeys(["@Aa"]))