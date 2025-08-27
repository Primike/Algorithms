// You are given a 2D 0-indexed integer array dimensions.
// For all indices i, 0 <= i < dimensions.length, dimensions[i][0] 
// represents the length and dimensions[i][1] 
// represents the width of the rectangle i.
// Return the area of the rectangle having the longest diagonal. 
// If there are multiple rectangles with the longest diagonal, 
// return the area of the rectangle having the maximum area.

// Time: O(n), Space: O(1)
func areaOfMaxDiagonal(_ dimensions: [[Int]]) -> Int {
    var result = 0
    var longest = 0.0

    for dimension in dimensions {
        let length = dimension[0]
        let width = dimension[1]
        let hypotenuse = pow(Double(length), 2.0) + pow(Double(width), 2)
        
        if hypotenuse > longest {
            result = length * width
            longest = hypotenuse
        } else if hypotenuse == longest {
            result = max(result, length * width)
        }
    }

    return result
}

print(areaOfMaxDiagonal([[9,3],[8,6]]))
print(areaOfMaxDiagonal([[3,4],[4,3]]))