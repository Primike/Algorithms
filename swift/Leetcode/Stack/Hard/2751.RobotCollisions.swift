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
    var result = [(Int, Int, Character)]()

    for (i, _, health, direction) in robots {
        if result.isEmpty || direction == "R" {
            result.append((i, health, direction))
            continue 
        }

        var health = health

        while let last = result.last, last.2 == "R", last.1 <= health {
            result.removeLast()
            health = last.1 == health ? 0 : health - 1
        }

        if result.isEmpty && health > 0 || result.last?.2 == "L" && health > 0 {
            result.append((i, health, direction))
        } else if let last = result.last, last.2 == "R", last.1 > health, health > 0 {
            result[result.count - 1].1 -= 1
            if last.1 == 1 { result.removeLast() }
        }
    }

    return result.sorted { $0.0 < $1.0 }.map { $0.1 }
}

print(survivedRobotsHealths([5,4,3,2,1], [2,17,9,15,10], "RRRRR"))
print(survivedRobotsHealths([3,5,2,6], [10,10,15,12], "RLRL"))
print(survivedRobotsHealths([1,2,5,6], [10,10,11,11], "RLRL"))