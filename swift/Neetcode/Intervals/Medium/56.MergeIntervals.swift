// Given an array of intervals where intervals[i] = [starti, endi],
// merge all overlapping intervals, and return an array of the non-overlapping 
// intervals that cover all the intervals in the input.

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var intervals = intervals.sorted { i, j in 
        if i[0] == j[0] {
            return i[1] < j[1]
        } else {
            return i[0] < j[0]
        }
    }

    var result = [[Int]]()

    for (i, interval) in intervals.enumerated() {
        if let last = result.last, last[1] >= interval[1] {
            continue
        } else if let last = result.last, last[1] >= interval[0] {
            let old = result.removeLast()
            result.append([old[0], interval[1]])
        } else {
            result.append(interval)
        }
    }

    return result
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[1,4],[4,5]]))