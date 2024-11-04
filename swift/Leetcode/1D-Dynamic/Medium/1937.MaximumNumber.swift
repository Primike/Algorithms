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
    var tab = Array(repeating: 0, count: cols)
    
    for i in 0..<rows {
        var leftScan = Array(repeating: 0, count: cols)
        leftScan[0] = tab[0]

        for j in 1..<cols {
            leftScan[j] = max(tab[j], leftScan[j - 1] - 1)
        }
        
        var rightScan = Array(repeating: 0, count: cols)
        rightScan[cols - 1] = tab[cols - 1]

        for j in (0..<(cols - 1)).reversed() {
            rightScan[j] = max(rightScan[j + 1] - 1, tab[j])
        }
        
        for j in 0..<cols {
            tab[j] = points[i][j] + max(leftScan[j], rightScan[j])
        }
    }
    
    return tab.max() ?? 0
}

print(maxPoints([[1,2,3],[1,5,1],[3,1,1]]))
print(maxPoints([[1,5],[2,3],[4,2]]))