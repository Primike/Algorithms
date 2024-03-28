struct Server: Comparable {
    let i: Int
    let weight: Int
    var time = 0
    var isUsed = false

    static func < (_ l: Server, _ r: Server) -> Bool {
        if l.isUsed { return (l.time) < (r.time) } 
        return (l.weight, l.i) < (r.weight, r.i)
    }    
}

// Time: O(m * n * logn), Space: O(n + m)
func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
    var availableServers = Heap<Server>(.minHeap)
    var usedServers = Heap<Server>(.minHeap)

    for (i, weight) in servers.enumerated() {
        availableServers.push(Server(i: i, weight: weight))
    }

    var result = [Int]()
    var time = 0, index = 0

    while index < tasks.count {
        if availableServers.isEmpty { time = usedServers.peek()!.time }

        while var first = usedServers.peek(), first.time <= time {
            usedServers.pop()
            first.isUsed = false
            availableServers.push(first)
        }

        while index < tasks.count, time >= index, !availableServers.isEmpty {
            var server = availableServers.pop()!
            server.time = time + tasks[index]
            server.isUsed = true
            usedServers.push(server)
            result.append(server.i)
            index += 1
        }

        time += 1
    }

    return result
}

print(assignTasks([3,3,2], [1,2,3,2,1,2]))
print(assignTasks([5,1,4,3,2], [2,1,2,4,5,2,1]))
print(assignTasks([1,2,3], [5,4,3,1,2]))