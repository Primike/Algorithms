// To gain points, you must pick one cell in each row. 
// Picking the cell at coordinates (r, c) will add points[r][c] to your score.
// However, you will lose points if you pick a cell too far 
// from the cell that you picked in the previous row. 
// For every two adjacent rows r and r + 1 (where 0 <= r < m - 1), 
// picking cells at coordinates (r, c1) and (r + 1, c2) 
// will subtract abs(c1 - c2) from your score.
// Return the maximum number of points you can achieve.

// Time: O(m * n), Space: O(n)
func maxPoints(_ points: [[Int]]) -> Int {
    let rows = points.count, cols = points[0].count
    var previousRow = points[0]

    for i in 1..<rows {
        var leftMax = Array(repeating: 0, count: cols)
        var rightMax = Array(repeating: 0, count: cols)
        leftMax[0] = previousRow[0]

        for j in 1..<cols {
            leftMax[j] = max(leftMax[j - 1] - 1, previousRow[j])
        }

        rightMax[cols - 1] = previousRow[cols - 1]

        for j in (0..<cols - 1).reversed()  {
            rightMax[j] = max(rightMax[j + 1] - 1, previousRow[j])
        }

        var currentRow = Array(repeating: 0, count: cols)

        for j in 0..<cols {
            currentRow[j] = points[i][j] + max(leftMax[j], rightMax[j])
        }

        previousRow = currentRow
    }

    return previousRow.max() ?? 0
}

print(maxPoints([[1,2,3],[1,5,1],[3,1,1]]))
print(maxPoints([[1,5],[2,3],[4,2]]))