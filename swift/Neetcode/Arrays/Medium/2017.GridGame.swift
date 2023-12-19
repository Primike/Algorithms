// You are given a 0-indexed 2D array grid of size 2 x n, 
// Two robots are playing a game on this matrix.
// The first robot wants to minimize the number of points collected by the second robot. 
// In contrast, the second robot wants to maximize the number of points it collects. 
// If both robots play optimally, return the number of points collected by the second robot.

func gridGame(_ grid: [[Int]]) -> Int {
    var topRow = grid[0].reduce(0, +), bottomRow = 0
    var result = Int.max

    for i in 0..<grid[0].count {
        topRow -= grid[0][i]
        result = min(result, max(topRow, bottomRow))
        bottomRow += grid[1][i]
    }

    return result
}

print(gridGame([[2,5,4],[1,5,1]]))
print(gridGame([[3,3,1],[8,5,2]]))
print(gridGame([[1,3,1,15],[1,3,3,1]]))