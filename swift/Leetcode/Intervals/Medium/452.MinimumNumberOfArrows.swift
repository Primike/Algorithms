// Arrows can be shot up directly vertically (in the positive y-direction) 
// from different points along the x-axis. A balloon with xstart and xend 
// is burst by an arrow shot at x if xstart <= x <= xend. 
// There is no limit to the number of arrows that can be shot. 
// A shot arrow keeps traveling up infinitely, bursting any balloons in its path.
// Given the array points, return the minimum number of arrows 
// that must be shot to burst all balloons.

// Time: O(n * logn), Space: O(1)
func findMinArrowShots(_ points: [[Int]]) -> Int {
    var sortedBalloons = points.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    var result = 0
    var i = 0

    while i < sortedBalloons.count {
        var end = sortedBalloons[i][1]

        while i < sortedBalloons.count, end >= sortedBalloons[i][0] {
            i += 1
            end = min(end, sortedBalloons[i - 1][1])
        }

        result += 1
    }

    return result
}

print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]))
print(findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]))