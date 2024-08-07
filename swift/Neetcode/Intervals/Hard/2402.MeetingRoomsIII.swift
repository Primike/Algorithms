// You are given a 2D integer array meetings where meetings[i] = [starti, endi] 
// means that a meeting will be held during the half-closed time interval 
// [starti, endi). All the values of starti are unique.
// Return the number of the room that held the most meetings. 
// If there are multiple rooms, return the room with the lowest number.

struct Room: Comparable {
    let room: Int
    var time: Int

    static func < (_ l: Room, _ r: Room) -> Bool {
        if l.time == r.time { return l.room < r.room }
        return l.time < r.time
    }
}

// Time: O(m * log(m) + m * log(n)), Space: O(n)
func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
    let meetings = meetings.sorted { $0[0] < $1[0] }
    var rooms = Array(repeating: 0, count: n)
    var freeRooms = Heap<Int>(.minHeap, Array(0..<n))
    var usedRooms = Heap<Room>(.minHeap)
    var time = 0

    for meeting in meetings {
        if time < meeting[0] { time = meeting[0] }
        if freeRooms.isEmpty { time = max(time, usedRooms.peek()!.time) }
        
        while let first = usedRooms.peek(), first.time <= time {
            usedRooms.pop()
            freeRooms.push(first.room)
        }

        let duration = meeting[1] - meeting[0]
        let smallestRoom = freeRooms.pop()!
        usedRooms.push(Room(room: smallestRoom, time: time + duration))
        rooms[smallestRoom] += 1
    }

    let largest = rooms.max() ?? 0
    return rooms.firstIndex(of: largest) ?? 0
}

print(mostBooked(2, [[0,10],[1,5],[2,7],[3,4]]))
print(mostBooked(3, [[1,20],[2,10],[3,5],[4,9],[6,8]]))


// Time: O(m * log(m) + n * m), Space: O(n)
func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
    let meetings = meetings.sorted { $0[0] < $1[0] }
    var result = Array(repeating: 0, count: n)
    var timeRoomIsFree = Array(repeating: 0, count: n)

    for meeting in meetings {
        var minimum = Int.max
        var index = 0
        var foundRoom = false

        for (i, time) in timeRoomIsFree.enumerated() {
            if time < minimum {
                minimum = time
                index = i

                if time <= meeting[0] { 
                    foundRoom = true 
                    break
                }
            }
        }
        
        let duration = meeting[1] - meeting[0]
        var time = foundRoom ? meeting[0] + duration : minimum + duration
        timeRoomIsFree[index] = time
        result[index] += 1
    }

    let largest = result.max() ?? 0
    return result.firstIndex(of: largest) ?? 0
}