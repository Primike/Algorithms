// x is the position of Person 1.
// y is the position of Person 2.
// z is the position of Person 3, who does not move.
// Determine which person reaches Person 3 first:
// Return 1 if Person 1 arrives first.
// Return 2 if Person 2 arrives first.
// Return 0 if both arrive at the same time.

// Time: O(1), Space: O(1)
func findClosest(_ x: Int, _ y: Int, _ z: Int) -> Int {
    let distanceX = abs(z - x)
    let distanceY = abs(z - y)

    if distanceX == distanceY { return 0 }
    return distanceX > distanceY ? 2 : 1
}

print(findClosest(2, 7, 4))
print(findClosest(2, 5, 6))
print(findClosest(1, 5, 3))