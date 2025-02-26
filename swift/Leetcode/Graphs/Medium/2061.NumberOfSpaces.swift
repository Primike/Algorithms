// A cleaning robot starts at the top left corner of the room 
// and is facing right. The robot will continue heading straight 
// until it reaches the edge of the room or it hits an object, 
// after which it will turn 90 degrees clockwise and repeat this process. 
// The starting space and all spaces that the robot visits are cleaned by it.
// Return the number of clean spaces in the room 
// if the robot runs indefinetely.

// Time: O(m * n), Space: O(m * n)
func numberOfCleanRooms(_ room: [[Int]]) -> Int {
    let rows = room.count, cols = room[0].count
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var visited = Set<String>()
    var cleaned = Set<[Int]>()

    func dfs(_ i: Int, _ j: Int, _ index: Int) -> Int {
        let key = "\(i),\(j),\(index)" 

        if visited.contains(key) { return cleaned.count }

        cleaned.insert([i, j])
        visited.insert(key)
        let r = i + directions[index].0
        let c = j + directions[index].1 
        
        if r < 0 || r >= rows || c < 0 || c >= cols || room[r][c] == 1 {
            return dfs(i, j, (index + 1) % 4)
        } else {
            return dfs(r, c, index)
        }
    }

    return dfs(0, 0, 0)
}

print(numberOfCleanRooms([[0,0,0],[1,1,0],[0,0,0]]))
print(numberOfCleanRooms([[0,1,0],[1,0,0],[0,0,0]]))
print(numberOfCleanRooms([[0,0,0],[0,0,0],[0,0,0]]))