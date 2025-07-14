// A robot on an infinite XY-plane starts at point (0, 0) facing north. 
// The robot receives an array of integers commands, 
// which represents a sequence of moves that it needs to execute. 
// There are only three possible types of instructions the robot can receive:
// -2: Turn left 90 degrees.
// -1: Turn right 90 degrees.
// 1 <= k <= 9: Move forward k units, one unit at a time.
// Some of the grid squares are obstacles. The ith obstacle 
// is at grid point obstacles[i] = (xi, yi). 
// If the robot runs into an obstacle, it will stay in its current location 
// (on the block adjacent to the obstacle) and move onto the next command.
// Return the maximum squared Euclidean distance that the robot reaches 
// at any point in its path (i.e. if the distance is 5, return 25).

// Time: O(n * m), Space: O(n)
func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
    let obstacles = Set(obstacles)
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result = 0
    var index = 0
    var i = 0, j = 0 
    
    for command in commands {
        if command > 0 {
            for _ in 1...command {
                let r = i + directions[index].0
                let c = j + directions[index].1
                
                if obstacles.contains([r, c]) { break }
                
                i = r
                j = c
            }
        } else if command == -1 {
            index = (index + 1) % 4
        } else if command == -2 {
            index = (index + 3) % 4
        }
        
        result = max(result, i * i + j * j)
    }
    
    return result
}

print(robotSim([4,-1,3], []))
print(robotSim([4,-1,4,-2,4], [[2,4]]))
print(robotSim([6,-1,-1,6], [[0,0]]))