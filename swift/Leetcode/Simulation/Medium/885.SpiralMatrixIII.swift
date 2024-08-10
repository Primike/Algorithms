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
    var result = [[Int]]()
    var i = rStart, j = cStart  
    var totalSteps = 1, currentSteps = 1, rotations = 2
    var k = 0
    
    while result.count < rows * cols {
        if i >= 0, i < rows, j >= 0, j < cols { result.append([i, j]) }

        i += directions[k].0
        j += directions[k].1
        currentSteps -= 1

        if currentSteps == 0 { 
            k = (k + 1) % directions.count
            rotations -= 1 

            if rotations == 0 {
                totalSteps += 1
                rotations = 2
            }

            currentSteps = totalSteps
        }
    }

    return result
}

print(spiralMatrixIII(1, 4, 0, 0))
print(spiralMatrixIII(5, 6, 1, 0))