// Given an array intervals where intervals[i] = [li, ri] 
// represent the interval [li, ri), remove all intervals that 
// are covered by another interval in the list.

// Time: O(n * log(n)), Space: O(1)
func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { ($0[0], -$0[1]) < ($1[0], -$1[1]) }
    var result = 0
    var last = intervals[0][1]

    for i in 1..<intervals.count {
        if intervals[i][1] > last {
            last = intervals[i][1]
            result += 1
        }
    }

    return result + 1
}

print(removeCoveredIntervals([[1,4],[3,6],[2,8]]))
print(removeCoveredIntervals([[1,4],[2,3]]))