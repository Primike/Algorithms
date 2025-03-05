// A company is organizing a meeting and has a list of n employees, 
// waiting to be invited. They have arranged for a large circular table, 
// capable of seating any number of employees.
// The employees are numbered from 0 to n - 1. 
// Each employee has a favorite person and they will attend the meeting 
// only if they can sit next to their favorite person at the table. 
// The favorite person of an employee is not themself.
// Given a 0-indexed integer array favorite, where favorite[i] 
// denotes the favorite person of the ith employee, 
// return the maximum number of employees that can be invited to the meeting.

// Time: O(n), Space: O(n)
func maximumInvitations(_ favorite: [Int]) -> Int {
    var inDegree = Array(repeating: 0, count: favorite.count)
    
    for next in favorite {
        inDegree[next] += 1
    }
    
    var queue = [Int]()

    for i in 0..<favorite.count {
        if inDegree[i] == 0 { queue.append(i) }
    }
    
    var depth = Array(repeating: 1, count: favorite.count)

    while !queue.isEmpty {
        let node = queue.removeFirst()
        let next = favorite[node]
        depth[next] = max(depth[next], depth[node] + 1)
        inDegree[next] -= 1

        if inDegree[next] == 0 { queue.append(next) }
    }
    
    var longestCycle = 0
    var twoCycleNodes = 0
    
    for i in 0..<favorite.count {
        if inDegree[i] == 0 { continue }
        
        var cycleLength = 0
        var current = i
        
        while inDegree[current] != 0 {
            inDegree[current] = 0
            cycleLength += 1
            current = favorite[current]
        }
        
        if cycleLength == 2 {
            twoCycleNodes += depth[i] + depth[favorite[i]]
        } else {
            longestCycle = max(longestCycle, cycleLength)
        }
    }
    
    return max(longestCycle, twoCycleNodes)
}

print(maximumInvitations([2,2,1,2]))
print(maximumInvitations([1,2,0]))
print(maximumInvitations([3,0,1,4,1]))