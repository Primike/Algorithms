// Insert newInterval into intervals such that intervals is still sorted in 
// ascending order by starti and intervals still does not have any overlapping 
// intervals (merge overlapping intervals if necessary).

// Time: O(n), Space: O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var current = newInterval

    for (i, interval) in intervals.enumerated() {
        if current[1] < interval[0] {
            result.append(current)
            return result + intervals[i...]
        } else if current[0] > interval[1] {
            result.append(interval)
        } else {
            current[0] = min(current[0], interval[0])
            current[1] = max(current[1], interval[1])
        }
    }
    
    result.append(current)
    return result
}

print(insert([[1,3],[6,9]], [2,5]))
print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))