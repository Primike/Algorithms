// You are given two integers m and n representing a 0-indexed m x n grid. 
// You are also given two 2D integer arrays guards and walls 
// where guards[i] = [rowi, coli] and walls[j] = [rowj, colj] 
// represent the positions of the ith guard and jth wall respectively.
// A guard can see every cell in the four cardinal directions 
// (north, east, south, or west) starting from their position 
// unless obstructed by a wall or another guard. 
// A cell is guarded if there is at least one guard that can see it.
// Return the number of unoccupied cells that are not guarded.

// Time: O(m * n), Space: O(m * n)
func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
    let guards = Set(guards)
    let walls = Set(walls)
    var rowPrefix = Array(repeating: Array(repeating: true, count: n), count: m)  
    var colPrefix = Array(repeating: Array(repeating: true, count: n), count: m)  

    for i in 0..<m {
        var bool = true

        for j in 0..<n {
            if guards.contains([i, j]) { bool = false } 
            if walls.contains([i, j]) { bool = true }           
            rowPrefix[i][j] = bool
        }

        for j in (0..<n).reversed() {
            if guards.contains([i, j]) { bool = false } 
            if walls.contains([i, j]) { bool = true }           
            rowPrefix[i][j] = rowPrefix[i][j] && bool
        }
    } 

    for j in 0..<n {
        var bool = true

        for i in 0..<m {
            if guards.contains([i, j]) { bool = false } 
            if walls.contains([i, j]) { bool = true }           
            colPrefix[i][j] = bool
        }

        for i in (0..<m).reversed() {
            if guards.contains([i, j]) { bool = false } 
            if walls.contains([i, j]) { bool = true }           
            colPrefix[i][j] = colPrefix[i][j] && bool
        }
    }    

    var result = 0

    for i in 0..<m {
        for j in 0..<n {
            if walls.contains([i, j]) { continue }
            if !rowPrefix[i][j] || !colPrefix[i][j] { continue }
            result += 1
        }
    }

    return result
}

print(countUnguarded(4, 6, [[0,0],[1,1],[2,3]], [[0,1],[2,2],[1,4]]))
print(countUnguarded(3, 3, [[1,1]], [[0,1],[1,0],[2,1],[1,2]]))