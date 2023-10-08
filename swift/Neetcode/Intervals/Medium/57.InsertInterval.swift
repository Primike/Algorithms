// Insert newInterval into intervals such that intervals is still sorted in 
// ascending order by starti and intervals still does not have any overlapping 
// intervals (merge overlapping intervals if necessary).

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var newInterval = newInterval

    for i in 0..<intervals.count {
        if newInterval[1] < intervals[i][0] {
            result.append(newInterval)
            return result + intervals[i...]
        } else if newInterval[0] > intervals[i][1] {
            result.append(intervals[i])
        } else {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
        }
    }
    
    result.append(newInterval)
    return result
}

print(insert([[1,3],[6,9]], [2,5]))
print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))