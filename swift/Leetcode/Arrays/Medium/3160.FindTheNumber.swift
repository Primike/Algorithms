// There are limit + 1 balls with distinct labels in the range [0, limit]. 
// Initially, all balls are uncolored. For every query in queries 
// that is of the form [x, y], you mark ball x with the color y. 
// After each query, you need to find the number of distinct colors among the balls.
// Return an array result of length n, where result[i] 
// denotes the number of distinct colors after ith query.

func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
    var result = [Int]()
    var colorMap = [Int: Int]()
    var ballMap = [Int: Int]()
    for query in queries {
        let ball = query[0]
        let color = query[1]
        if let prevColor = ballMap[ball] {
            colorMap[prevColor]! -= 1
            if colorMap[prevColor] == 0 {
                colorMap.removeValue(forKey: prevColor)
            }
        }
        ballMap[ball] = color
        colorMap[color, default: 0] += 1
        result.append(colorMap.count)
    }
    return result
}

print(queryResults(4, [[1,4],[2,5],[1,3],[3,4]]))
print(queryResults(4, [[0,1],[1,2],[2,2],[3,4],[4,5]]))