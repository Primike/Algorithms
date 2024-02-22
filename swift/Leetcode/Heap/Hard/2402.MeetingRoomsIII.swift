// You are given a 2D integer array meetings where meetings[i] = [starti, endi] 
// means that a meeting will be held during the half-closed time interval 
// [starti, endi). All the values of starti are unique.
// Return the number of the room that held the most meetings. 
// If there are multiple rooms, return the room with the lowest number.

struct Occupied: Comparable {
    let end: Int64
    let room: Int

    static func < (_ l: Occupied, _ r: Occupied) -> Bool {
        return l.end < r.end
    }
}

// Time: O(m * logm), Space: O(n + m)
func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
    let meetings = meetings.sorted { $0[0] < $1[0] }.map { [Int64($0[0]), Int64($0[1])] }
    var result = Array(repeating: 0, count: n)
    var rooms = Heap<Int>(.minHeap, Array(0..<n))
    var occupied = Heap<Occupied>(.minHeap)
    var time: Int64 = 0

    for meeting in meetings {
        if rooms.isEmpty { time = max(time, occupied.peek()!.end) }

        let start = max(time, meeting[0])

        while let first = occupied.peek(), first.end <= start {
            rooms.push(first.room)
            occupied.pop()
        }

        let smallestRoom = rooms.pop()!
        result[smallestRoom] += 1
        occupied.push(Occupied(end: start + meeting[1] - meeting[0], room: smallestRoom))
    }

    let mostMeetings = result.max() ?? 0

    for (i, meetings) in result.enumerated() {
        if meetings == mostMeetings { return i }
    }

    return 0
}

print(mostBooked(2, [[0,10],[1,5],[2,7],[3,4]]))
print(mostBooked(3, [[1,20],[2,10],[3,5],[4,9],[6,8]]))