// You start at the cell (rStart, cStart) of an rows x cols grid facing east. 
// The northwest corner is at the first row and column in the grid, 
// and the southeast corner is at the last row and column.
// You will walk in a clockwise spiral shape to visit every position 
// in this grid. Whenever you move outside the grid's boundary,
// we continue our walk outside the grid (but may return to the grid boundary later.). 
// Eventually, we reach all rows * cols spaces of the grid.
// Return an array of coordinates representing the positions of the grid 
// in the order you visited them.

// Time: O(max(m * n)^2), Space: O(m * n)
func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result = [[rStart, cStart]]
    var x = rStart, y = cStart
    var index = 0
    var steps = 1
    
    while result.count < rows * cols {
        for i in 0..<2 {
            for j in 0..<steps {
                x += directions[index].0
                y += directions[index].1

                if x < 0 || x >= rows || y < 0 || y >= cols { continue }

                result.append([x, y])
            }

            index = (index + 1) % 4
        }

        steps += 1
    }   

    return result
}

print(spiralMatrixIII(1, 4, 0, 0))
print(spiralMatrixIII(5, 6, 1, 0))