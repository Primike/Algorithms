func maximumInvitations(_ favorite: [Int]) -> Int {
    let n = favorite.count
    var inDegree = [Int](repeating: 0, count: n)
    
    for person in 0..<n {
        inDegree[favorite[person]] += 1
    }
    
    var queue = [Int]()
    for person in 0..<n {
        if inDegree[person] == 0 {
            queue.append(person)
        }
    }
    
    var depth = [Int](repeating: 1, count: n)
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        let nextNode = favorite[currentNode]
        depth[nextNode] = max(depth[nextNode], depth[currentNode] + 1)
        inDegree[nextNode] -= 1
        if inDegree[nextNode] == 0 {
            queue.append(nextNode)
        }
    }
    
    var longestCycle = 0
    var twoCycleInvitations = 0
    
    for person in 0..<n {
        if inDegree[person] == 0 {
            continue
        }
        
        var cycleLength = 0
        var current = person
        while inDegree[current] != 0 {
            inDegree[current] = 0
            cycleLength += 1
            current = favorite[current]
        }
        
        if cycleLength == 2 {
            twoCycleInvitations += depth[person] + depth[favorite[person]]
        } else {
            longestCycle = max(longestCycle, cycleLength)
        }
    }
    
    return max(longestCycle, twoCycleInvitations)
}