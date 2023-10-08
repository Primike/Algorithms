// Given an array of intervals intervals where intervals[i] = [starti, endi], 
// return the minimum number of intervals you need to remove to make the 
// rest of the intervals non-overlapping.

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {        
    var intervals = intervals.sorted { $0[1] < $1[1] }
    var previous = intervals[0][0]
    var result = 0

    for interval in intervals {
        if interval[0] < previous {
            result += 1
        } else {
            previous = interval[1]
        }
    }

    return result
}

print(eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]))
print(eraseOverlapIntervals([[1,2],[1,2],[1,2]]))
print(eraseOverlapIntervals([[1,2],[2,3]]))