// Given a string path, where path[i] = 'N', 'S', 'E' or 'W', 
// each representing moving one unit north, south, east, or west, 
// respectively. You start at the origin (0, 0) on a 2D plane 
// and walk on the path specified by path.
// Return true if the path crosses itself at any point, that is, 
// if at any time you are on a location you have previously visited. 
// Return false otherwise.

// Time: O(n), Space: O(n)
func isPathCrossing(_ path: String) -> Bool {
    var visited = Set([[0, 0]])
    var current = [0 ,0]

    for direction in path {
        if direction == "N" {
            current[0] += 1
        } else if direction == "S" {
            current[0] -= 1
        } else if direction == "E" {
            current[1] += 1
        } else if direction == "W" {
            current[1] -= 1
        }

        if visited.contains(current) { return true }
        visited.insert(current)
    }

    return false
}

print(isPathCrossing("NES"))
print(isPathCrossing("NESWW"))