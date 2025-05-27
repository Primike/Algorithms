// Given an m x n matrix of distinct numbers, 
// return all lucky numbers in the matrix in any order.
// A lucky number is an element of the matrix such that 
// it is the minimum element in its row and maximum in its column.

// Time: O(m * n), Space: O(m + n)
func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
    let rows = matrix.count, cols = matrix[0].count
    var rowMax = Array(repeating: Int.max, count: rows)
    var colMin = Array(repeating: Int.min, count: cols)

    for i in 0..<rows {
        for j in 0..<cols {
            rowMax[i] = min(rowMax[i], matrix[i][j])
            colMin[j] = max(colMin[j], matrix[i][j])
        }
    }

    var result = [Int]()

    for i in 0..<rows {
        for j in 0..<cols {
            let number = matrix[i][j]

            if rowMax[i] == number, colMin[j] == number {
                result.append(number)
            }
        }
    }

    return result
}

print(luckyNumbers([[3,7,8],[9,11,13],[15,16,17]]))
print(luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]]))
print(luckyNumbers([[7,8],[1,2]]))