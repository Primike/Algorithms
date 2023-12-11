// Given an array of intervals where intervals[i] = [starti, endi],
// merge all overlapping intervals, and return an array of the non-overlapping 
// intervals that cover all the intervals in the input.

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var intervals = intervals.sorted { i, j in 
        if i[0] == j[0] { return i[1] < j[1] }
        return i[0] < j[0]
    }        

    var result = [[Int]]()
    var i = 0

    while i < intervals.count {
        var new = intervals[i]
        i += 1

        while i < intervals.count, new[1] >= intervals[i][0] {
            new = [new[0], max(new[1], intervals[i][1])]
            i += 1
        }

        result.append(new)
    }

    return result
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[1,4],[4,5]]))