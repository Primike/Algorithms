//You are given a 0-indexed 2D array grid of size 2 x n, 
//Two robots are playing a game on this matrix.
//The first robot wants to minimize the number of points collected by the second robot. 
//In contrast, the second robot wants to maximize the number of points it collects. 
//If both robots play optimally, return the number of points collected by the second robot.

func gridGame(_ grid: [[Int]]) -> Int {
    var topPrefix = grid[0]
    var bottomPrefix = grid[1]

    for i in 1..<topPrefix.count {
        topPrefix[i] += topPrefix[i - 1]
        bottomPrefix[i] += bottomPrefix[i - 1]
    }

    var result = Int.max

    for i in 0..<grid[0].count {
        let topSum = topPrefix.last! - topPrefix[i]
        let bottomSum = i > 0 ? bottomPrefix[i - 1] : 0
        let secondRobot = max(topSum, bottomSum)
        
        result = min(result, secondRobot)
    }

    return result
}

print(gridGame([[2,5,4],[1,5,1]]))
print(gridGame([[3,3,1],[8,5,2]]))
print(gridGame([[1,3,1,15],[1,3,3,1]]))