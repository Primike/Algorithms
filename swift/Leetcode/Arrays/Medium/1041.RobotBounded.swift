// The robot performs the instructions given in order, and repeats them forever.
// Return true if and only if there exists a circle in the plane such that 
// the robot never leaves the circle.

// Time: O(n), Space: O(1)
func isRobotBounded(_ instructions: String) -> Bool {
    let instructions = Array(instructions)
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var x = 0, y = 0
    var index = 0

    for letter in instructions {
        if letter == "L" {
            index = (index + 3) % 4
        } else if letter == "R" {
            index = (index + 1) % 4
        } else {
            x += directions[index].0
            y += directions[index].1
        }
    }

    return (x == 0 && y == 0) || index != 0
}

print(isRobotBounded("GGLLGG"))
print(isRobotBounded("GG"))
print(isRobotBounded("GL"))