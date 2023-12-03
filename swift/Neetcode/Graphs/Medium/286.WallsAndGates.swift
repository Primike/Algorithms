// Fill each empty room with the distance to its nearest gate. 
// If it is impossible to reach a gate, it should be filled with INF.

func wallsAndGates(_ rooms: inout [[Int]]) {
    let rows = rooms.count, cols = rooms[0].count
    var gates = [(Int, Int)]()
    var queue = [(Int, Int)]()
    var visited = Set<String>()

    for i in 0..<rows {
        for j in 0..<cols {
            if rooms[i][j] == 0 { 
                gates.append((i, j)) 
                queue.append((i, j))
                visited.insert("\(i),\(j)")
            }
        }
    }

    var length = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (i, j) = queue.removeFirst()
            let directions = [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]

            for (di, dj) in directions {
                let key = "\(di),\(dj)"

                if di < 0 || di >= rows || dj < 0 || dj >= cols { continue }
                if visited.contains(key) || rooms[di][dj] == -1 { continue }
                
                rooms[di][dj] = length
                queue.append((di, dj))
                visited.insert(key)
            }
        }

        length += 1
    }
}

print(wallsAndGates([
    [2147483647,-1,0,2147483647],
    [2147483647,2147483647,2147483647,-1],
    [2147483647,-1,2147483647,-1],
    [0,-1,2147483647,2147483647]]))
print(wallsAndGates([[-1]]))