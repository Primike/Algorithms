// There is a party where n friends numbered from 0 to n - 1 are attending. 
// There is an infinite number of chairs in this party that are 
// numbered from 0 to infinity. When a friend arrives at the party,
// they sit on the unoccupied chair with the smallest number.
// When a friend leaves the party, their chair becomes unoccupied 
// at the moment they leave. If another friend arrives at that same moment, 
// they can sit in that chair.
// You are given a 0-indexed 2D integer array times where times[i] = [arrivali, leavingi], 
// indicating the arrival and leaving times of the ith friend respectively, 
// and an integer targetFriend. All arrival times are distinct.
// Return the chair number that the friend numbered targetFriend will sit on.

struct Friend: Comparable {
    let i: Int
    let leave: Int
    let seat: Int 

    static func < (_ l: Friend, _ r: Friend) -> Bool {
        return l.leave < r.leave
    }
}

// Time: O(n * log(n)), Space: O(n)
func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
    var friends = [(Int, Int, Int)]()
    
    for i in 0..<times.count {
        friends.append((i, times[i][0], times[i][1]))
    }

    friends.sort { $0.1 < $1.1 }

    var sittingFriends = Heap<Friend>(.minHeap)
    var seats = Heap<Int>(.minHeap, Array(0..<times.count))
    var time = 0

    for i in 0..<friends.count {
        time = max(time, friends[i].1)

        while let first = sittingFriends.peek(), first.leave <= time {
            sittingFriends.pop()
            seats.push(first.seat)
        }

        if friends[i].0 == targetFriend { return seats.peek()! }

        let seat = seats.pop()!
        sittingFriends.push(Friend(i: i, leave: friends[i].2, seat: seat))
    }

    return -1
}

print(smallestChair([[1,4],[2,3],[4,6]], 1))
print(smallestChair([[3,10],[1,5],[2,6]], 0))