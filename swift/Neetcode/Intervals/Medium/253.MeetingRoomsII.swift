// Given an array of meeting time intervals intervals where 
// intervals[i] = [starti, endi], return the minimum number of 
// conference rooms required.

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let startTimes = intervals.map { $0[0] }.sorted()
    let endTimes = intervals.map { $0[1] }.sorted()

    var start = 0, end = 0
    var result = 0

    while start < intervals.count {
        if startTimes[start] >= endTimes[end] {
            result -= 1
            end += 1
        }

        result += 1
        start += 1
    }

    return result
}

print(minMeetingRooms([[0,30],[5,10],[15,20]]))
print(minMeetingRooms([[7,10],[2,4]]))