// You are given two integers m and n representing a 0-indexed m x n grid. 
// You are also given two 2D integer arrays guards and walls 
// where guards[i] = [rowi, coli] and walls[j] = [rowj, colj] 
// represent the positions of the ith guard and jth wall respectively.
// A guard can see every cell in the four cardinal directions 
// (north, east, south, or west) starting from their position 
// unless obstructed by a wall or another guard. 
// A cell is guarded if there is at least one guard that can see it.
// Return the number of unoccupied cells that are not guarded.

func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
    var matrix = Array(repeating: Array(repeating: "Safe", count: n), count: m)

    for position in guards {
        matrix[position[0]][position[1]] = "Guard"
    } 

    for position in walls {
        matrix[position[0]][position[1]] = "Wall"
    }

    for i in 0..<m {
        var guarded = false
        var visited = [(Int, Int)]()

        for j in 0..<n {
            if matrix[i][j] == "Guard" {
                guarded = true

                while let (x, y) = visited.popLast() {
                    matrix[x][y] = "Unsafe"
                }
            } else if matrix[i][j] == "Wall" {
                guarded = false
                visited = []
            } else {
                if guarded { 
                    matrix[i][j] = "Unsafe" 
                } else {
                    visited.append((i, j))
                }
            }
        }
    }

    var result = 0

    for j in 0..<n {
        var guarded = false
        var visited = [(Int, Int)]()

        for i in 0..<m {
            if matrix[i][j] == "Guard" {
                guarded = true

                while let (x, y) = visited.popLast() {
                    matrix[x][y] = "Unsafe"
                    result -= 1
                }
            } else if matrix[i][j] == "Wall" {
                guarded = false
                visited = []
            } else if matrix[i][j] == "Safe" {
                if guarded { 
                    matrix[i][j] = "Unsafe" 
                } else {
                    visited.append((i, j))
                }
            }

            if matrix[i][j] == "Safe" { result += 1 }
        }
    }

    return result
}

print(countUnguarded(4, 6, [[0,0],[1,1],[2,3]], [[0,1],[2,2],[1,4]]))
print(countUnguarded(3, 3, [[1,1]], [[0,1],[1,0],[2,1],[1,2]]))