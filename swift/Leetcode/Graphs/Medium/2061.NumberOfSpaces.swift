// A cleaning robot starts at the top left corner of the room 
// and is facing right. The robot will continue heading straight 
// until it reaches the edge of the room or it hits an object, 
// after which it will turn 90 degrees clockwise and repeat this process. 
// The starting space and all spaces that the robot visits are cleaned by it.
// Return the number of clean spaces in the room 
// if the robot runs indefinetely.

func numberOfCleanRooms(_ room: [[Int]]) -> Int {
    let rows = room.count, cols = room[0].count
    let directions = [0, 1, 0, -1, 0]
    var visited = Set<String>()
    var cleaned = Set<String>()

    func dfs(_ i: Int, _ j: Int, _ direction: Int) -> Int {
        let key = "\(i),\(j),\(direction)"

        if visited.contains(key) { return cleaned.count }

        visited.insert(key)
        cleaned.insert("\(i),\(j)")

        let r = i + directions[direction]
        let c = j + directions[direction + 1]

        if r >= 0, r < rows, c >= 0, c < cols, room[r][c] == 0 {
            return dfs(r, c, direction)
        }

        return dfs(i, j, (direction + 1) % 4)
    }

    return dfs(0, 0, 0)
}

print(numberOfCleanRooms([[0,0,0],[1,1,0],[0,0,0]]))
print(numberOfCleanRooms([[0,1,0],[1,0,0],[0,0,0]]))
print(numberOfCleanRooms([[0,0,0],[0,0,0],[0,0,0]]))