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
    var x = 0, y = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j].isLetter, !locks.contains(grid[i][j]) {
                target[Int(grid[i][j].asciiValue!) - 97] = 1
            } else if grid[i][j] == "@" {
                x = i
                y = j
            }
        }
    }

    var visited = Set<[Int]>()
    visited.insert([x, y, 0, 0, 0, 0, 0, 0])
    var queue = [(x, y, [0, 0, 0, 0, 0, 0])]
    var result = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            var (i, j, keys) = queue.removeFirst()
            let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

            for (di, dj) in directions {
                var newKeys = keys

                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if visited.contains([di, dj] + newKeys) || grid[di][dj] == "#" { continue }

                let cell = grid[di][dj]

                if locks.contains(cell), newKeys[Int(cell.asciiValue!) - 65] != 1 { continue }
                if cell.isLowercase { newKeys[Int(cell.asciiValue!) - 97] = 1 }
                if newKeys == target { return result }

                visited.insert([di, dj] + newKeys)
                queue.append((di, dj, newKeys))
            }
        }

        result += 1
    }

    return -1
}

print(shortestPathAllKeys(["@.a..","###.#","b.A.B"]))
print(shortestPathAllKeys(["@..aA","..B#.","....b"]))
print(shortestPathAllKeys(["@Aa"]))