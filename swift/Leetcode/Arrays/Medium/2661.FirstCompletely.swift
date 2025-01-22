// You are given a 0-indexed integer array arr, and an m x n integer matrix mat. 
// arr and mat both contain all the integers in the range [1, m * n].
// Go through each index i in arr starting from index 0 and paint the cell 
// in mat containing the integer arr[i].
// Return the smallest index i at which either a row or a column will be 
// completely painted in mat.

// Time: O(m * n), Space: O(m * n)
func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
    let rows = mat.count, cols = mat[0].count
    var positions = Array(repeating: (0, 0), count: arr.count + 1)

    for i in 0..<rows {
        for j in 0..<cols {
            positions[mat[i][j]] = (i, j)
        }
    }

    var rowsSets = Array(repeating: Set<Int>(), count: rows)
    var colsSets = Array(repeating: Set<Int>(), count: cols)

    for i in 0..<arr.count {
        let (r, c) = positions[arr[i]]
        rowsSets[r].insert(arr[i])
        colsSets[c].insert(arr[i])

        if rowsSets[r].count == cols { return i }
        if colsSets[c].count == rows { return i }
    }

    return arr.count
}

print(firstCompleteIndex([1,3,4,2], [[1,4],[2,3]]))
print(firstCompleteIndex([2,8,7,4,1,3,5,6,9], [[3,2,5],[1,4,6],[8,7,9]]))