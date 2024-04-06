// There is a ball in a maze with empty spaces (represented as 0) and walls 
// (represented as 1). The ball can go through the empty spaces by 
// rolling up, down, left or right, but it won't stop rolling until hitting a wall. 
// When the ball stops, it could choose the next direction.
// Given the m x n maze, the ball's start position and the destination, 
// where start = [startrow, startcol] and destination = [destinationrow, destinationcol], 
// return true if the ball can stop at the destination, otherwise return false.
// You may assume that the borders of the maze are all walls (see examples).

// Time: O(m * n * (m + n)), Space: O(m * n)
func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
    let rows = maze.count, cols = maze[0].count
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Bool {
        let key = "\(i),\(j)"

        if visited.contains(key) { return false }

        visited.insert(key)

        for (di, dj) in directions {
            var r = i, c = j

            while r >= 0, r < rows, c >= 0, c < cols, maze[r][c] != 1 {
                r += di
                c += dj

                if i == destination[0], j == destination[1] { return true }
            }

            r -= di
            c -= dj

            if dfs(r, c) { return true }
        }

        return false 
    }

    return dfs(start[0], start[1])
}

print(hasPath([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [4,4]))
print(hasPath([[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], [0,4], [3,2]))
print(hasPath([[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], [4,3], [0,1]))