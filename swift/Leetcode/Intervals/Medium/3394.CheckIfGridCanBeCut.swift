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
    let horizontal = rectangles.map { [$0[0], $0[2]] }.sorted { $0[0] < $1[0] }
    let vertical = rectangles.map { [$0[1], $0[3]] }.sorted { $0[0] < $1[0] }
    var last = horizontal[0][1]
    var count = 0

    for interval in horizontal {
        if last <= interval[0] {
            count += 1
            last = interval[1]
        } else {
            last = max(last, interval[1])
        }
    }

    if count >= 2 { return true }
    
    last = vertical[0][1]
    count = 0

    for interval in vertical {
        if last <= interval[0] {
            count += 1
            last = interval[1]
        } else {
            last = max(last, interval[1])
        }
    }

    return count >= 2
}

print(checkValidCuts(5, [[1,0,5,2],[0,2,2,4],[3,2,5,3],[0,4,4,5]]))
print(checkValidCuts(4, [[0,0,1,1],[2,0,3,4],[0,2,2,3],[3,0,4,3]]))
print(checkValidCuts(4, [[0,2,2,4],[1,0,3,2],[2,2,3,4],[3,0,4,2],[3,2,4,4]]))