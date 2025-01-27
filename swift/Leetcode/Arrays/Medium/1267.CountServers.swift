// You are given a map of a server center, represented as a m * n integer matrix grid, 
// where 1 means that on that cell there is a server and 0 means that it is no server. 
// Two servers are said to communicate if they are on the same row or on the same column.
// Return the number of servers that communicate with any other server.

// Time: O(m * n), Space: O(m * n)
func countServers(_ grid: [[Int]]) -> Int {
    var rows = grid.count, cols = grid[0].count
    var rowsDict = [Int: Int](), colsDict = [Int: Int]()

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 1 {
                rowsDict[i, default: 0] += 1
                colsDict[j, default: 0] += 1
            }
        }
    }

    var result = 0

    for i in 0..<rows {
        for j in 0..<cols {
            if grid[i][j] == 0 { continue }
            if rowsDict[i] ?? 0 > 1 || colsDict[j] ?? 0 > 1 { result += 1 }
        }
    }

    return result
}

print(countServers([[1,0],[0,1]]))
print(countServers([[1,0],[1,1]]))
print(countServers([[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]]))