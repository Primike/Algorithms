// You are given an m x n matrix of characters 
// boxGrid representing a side-view of a box. 
// Each cell of the box is one of the following:
// A stone '#' A stationary obstacle '*' Empty '.'
// The box is rotated 90 degrees clockwise, causing some of the stones 
// to fall due to gravity. Each stone falls down until 
// it lands on an obstacle, another stone, or the bottom of the box. 
// Gravity does not affect the obstacles' positions, 
// and the inertia from the box's rotation does not affect 
// the stones' horizontal positions.
// It is guaranteed that each stone in boxGrid rests on an obstacle, 
// another stone, or the bottom of the box.
// Return an n x m matrix representing the box after the rotation described above.

func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
    let rows = box.count, cols = box[0].count
    var result = Array(repeating: Array(repeating: Character("."), count: rows), count: cols)

    for i in 0..<rows {
        var empty = cols - 1

        for j in (0..<cols).reversed() {
            if box[i][j] == "*" {
                result[j][rows - 1 - i] = "*"
                empty = j - 1
            } else if box[i][j] == "#" {
                result[empty][rows - 1 - i] = "#"
                empty -= 1
            }
        }
    }

    return result
}

print(rotateTheBox([["#",".","#"]]))
print(rotateTheBox([["#",".","*","."], ["#","#","*","."]]))
print(rotateTheBox([["#","#","*",".","*","."],
                    ["#","#","#","*",".","."],
                    ["#","#","#",".","#","."]]))