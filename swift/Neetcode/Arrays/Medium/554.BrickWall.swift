//Given the 2D array wall that contains the information about the wall, 
//return the minimum number of crossed bricks after drawing such a vertical line.

func leastBricks(_ wall: [[Int]]) -> Int {
    var indexDict = [Int: Int]()

    for row in wall {
        var index = 0

        for i in 0..<row.count - 1 {
            index += row[i]
            indexDict[index, default: 0] += 1
        }
    }

    return wall.count - (indexDict.values.max() ?? 0)
}

print(leastBricks([[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]))
print(leastBricks([[1],[1],[1]]))