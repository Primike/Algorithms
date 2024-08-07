// Given an array of meeting time intervals intervals where 
// intervals[i] = [starti, endi], return the minimum number of 
// conference rooms required.

struct Room: Comparable {
    let start: Int
    let end: Int

    static func < (_ l: Room, _ r: Room) -> Bool {
        return l.end < r.end 
    }
}

// Time: O(n * log(n)), Space: O(n)
func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    var intervals = intervals.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    var heap = Heap<Room>(.minHeap)
    var result = 0

    for meeting in intervals {
        while let first = heap.peek(), first.end <= meeting[0] {
            heap.pop()
        }

        heap.push(Room(start: meeting[0], end: meeting[1]))
        result = max(result, heap.count)
    }

    return result
}

print(minMeetingRooms([[0,30],[5,10],[15,20]]))
print(minMeetingRooms([[7,10],[2,4]]))