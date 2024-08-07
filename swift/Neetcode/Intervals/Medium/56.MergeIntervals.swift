// Given an array of intervals where intervals[i] = [starti, endi],
// merge all overlapping intervals, and return an array of the non-overlapping 
// intervals that cover all the intervals in the input.

// Time: O(n * logn), Space: O(n)
func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var result = [[Int]]()

    for interval in intervals {
        if let last = result.last, last[1] >= interval[0] {
            result[result.count - 1][1] = max(last[1], interval[1])
        } else {
            result.append(interval)
        }
    }

    return result
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[1,4],[4,5]]))