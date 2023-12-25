// You are given an m x n integer matrix matrix with the following two properties:
// Each row is sorted in non-decreasing order.
// The first integer of each row is greater than the last integer of the previous row.
// Given an integer target, return true if target is in matrix or false otherwise.
// You must write a solution in O(log(m * n)) time complexity.

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rows = matrix.count, cols = matrix[0].count
    var left = 0, right = rows - 1

    while left < right {
        let mid = (right + left) / 2

        if matrix[mid][cols - 1] >= target {
            right = mid
        } else {
            left = mid + 1
        }
    }

    let row = left
    left = 0
    right = cols - 1

    while left <= right {
        var mid = (right + left) / 2

        if matrix[row][mid] < target {
            left = mid + 1
        } else if matrix[row][mid] > target {
            right = mid - 1
        } else {
            return true
        }
    }

    return false
}

print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))