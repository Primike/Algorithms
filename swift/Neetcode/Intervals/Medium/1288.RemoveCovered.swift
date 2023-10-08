// Given an array intervals where intervals[i] = [li, ri] 
// represent the interval [li, ri), remove all intervals that 
// are covered by another interval in the list.

func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
    var intervals = intervals.sorted { ($0[0], -$0[1]) < ($1[0], -$1[1]) }
    var previous = intervals[0]
    var result = 1

    for i in 1..<intervals.count {
        if intervals[i][1] > previous[1] {
            result += 1
            previous = intervals[i]
        }
    }

    return result
}

print(removeCoveredIntervals([[1,4],[3,6],[2,8]]))
print(removeCoveredIntervals([[1,4],[2,3]]))