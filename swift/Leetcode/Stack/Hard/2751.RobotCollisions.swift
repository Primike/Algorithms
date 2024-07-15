// All robots start moving on the line simultaneously 
// at the same speed in their given directions. 
// If two robots ever share the same position while moving, they will collide.
// If two robots collide, the robot with lower health is removed from the line, 
// and the health of the other robot decreases by one. 
// The surviving robot continues in the same direction it was going. 
// If both robots have the same health, they are both removed from the line.
// Return an array containing the health of the remaining robots 
// (in the order they were given in the input), after no further collisions can occur.

// Time: O(n * log(n)), Space: O(n)
func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
    let directions = Array(directions)
    var robots = [(Int, Int, Int, Character)]()

    for i in 0..<positions.count {
        robots.append((i, positions[i], healths[i], directions[i]))
    }

    robots.sort { $0.1 < $1.1 }
    var stack = [(Int, Int, Int, Character)]()

    for i in 0..<robots.count {
        var current = robots[i]

        if current.3 == "R" { 
            stack.append(current)
            continue 
        }

        while let last = stack.last, last.3 == "R", last.2 <= current.2, current.2 > 0 {
            stack.removeLast()
            if last.2 == current.2 { current.2 = 0 }
            current.2 -= 1
        }

        if var last = stack.last, last.3 == "R" {
            if current.2 > 0 { last.2 -= 1 }
            if last.2 == 0 { 
                stack.removeLast()
            } else {
                stack[stack.count - 1] = last
            }
        } else if current.2 > 0 {
            stack.append(current)
        }
    }

    return stack.sorted { $0.0 < $1.0 }.map { $0.2 } 
}

print(survivedRobotsHealths([5,4,3,2,1], [2,17,9,15,10], "RRRRR"))
print(survivedRobotsHealths([3,5,2,6], [10,10,15,12], "RLRL"))
print(survivedRobotsHealths([1,2,5,6], [10,10,11,11], "RLRL"))