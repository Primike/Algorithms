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