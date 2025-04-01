// You are given an integer n representing the dimensions of an n x n grid, 
// with the origin at the bottom-left corner of the grid. 
// You are also given a 2D array of coordinates rectangles, 
// where rectangles[i] is in the form [startx, starty, endx, endy], 
// representing a rectangle on the grid. Each rectangle is defined as follows:
// Note that the rectangles do not overlap. Your task is to determine 
// if it is possible to make either two horizontal or two vertical cuts 
// on the grid such that:
// Each of the three resulting sections formed by the cuts 
// contains at least one rectangle.
// Every rectangle belongs to exactly one section.
// Return true if such cuts can be made; otherwise, return false.

// Time: O(n * log(n)), Space: O(n)
func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
    let horizontal = rectangles.sorted { ($0[0], -$0[2]) < ($1[0], -$1[2]) }
    var xIntervals = [[Int]]()
    var i = 0

    while i < horizontal.count {
        var current = horizontal[i]

        while i < horizontal.count, current[2] > horizontal[i][0] {
            current[2] = max(current[2], horizontal[i][2])
            i += 1
        }

        xIntervals.append(current)
    }

    if xIntervals.count >= 3 { return true }

    let vertical = rectangles.sorted { ($0[1], -$0[3]) < ($1[1], -$1[3]) }
    var yIntervals = [[Int]]()
    i = 0

    while i < vertical.count {
        var current = vertical[i]

        while i < vertical.count, current[3] > vertical[i][1] {
            current[3] = max(current[3], vertical[i][3])
            i += 1
        }

        yIntervals.append(current)
    }

    return yIntervals.count >= 3
}

print(checkValidCuts(5, [[1,0,5,2],[0,2,2,4],[3,2,5,3],[0,4,4,5]]))
print(checkValidCuts(4, [[0,0,1,1],[2,0,3,4],[0,2,2,3],[3,0,4,3]]))
print(checkValidCuts(4, [[0,2,2,4],[1,0,3,2],[2,2,3,4],[3,0,4,2],[3,2,4,4]]))