// Given an array of meeting time intervals where intervals[i] = [starti, endi], 
// determine if a person could attend all meetings.

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    var intervals = intervals.sorted { $0[0] < $1[0] }
    var previous = [-1, -1]

    for interval in intervals {
        if previous[1] > interval[0] { return false }
        
        previous = interval
    }

    return true 
}

print(canAttendMeetings([[0,30],[5,10],[15,20]]))
print(canAttendMeetings([[7,10],[2,4]]))