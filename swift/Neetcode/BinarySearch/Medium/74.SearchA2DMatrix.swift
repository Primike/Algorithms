//You are given an m x n integer matrix matrix with the following two properties:
//Each row is sorted in non-decreasing order.
//The first integer of each row is greater than the last integer of the previous row.
//Given an integer target, return true if target is in matrix or false otherwise.
//You must write a solution in O(log(m * n)) time complexity.

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var left = 0, right = matrix.count - 1
    var row = 0

    while left <= right {
        row = (right + left) / 2

        if let last = matrix[row].last, last < target {
            left = row + 1
        } else if matrix[row][0] > target {
            right = row - 1
        } else {
            left = 0
            right = matrix[row].count - 1
            break
        }
    }

    while left <= right {
        var midpoint = (right + left) / 2

        if matrix[row][midpoint] < target {
            left = midpoint + 1
        } else if matrix[row][midpoint] > target {
            right = midpoint - 1
        } else {
            return true
        }
    }

    return false
}

print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))