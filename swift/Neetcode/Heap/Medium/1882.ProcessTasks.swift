struct Server: Comparable {
    let index: Int
    let weight: Int
    var time = 0
    var isUsed = false

    static func <(_ l: Server, _ r: Server) -> Bool {
        if l.isUsed { return (l.time) < (r.time) }
        return (l.weight, l.index) < (r.weight, r.index)
    }
}

// Time: O(m * n * logn), Space: O(n + m)
func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
    var usedHeap = Heap<Server>(.minHeap)
    var freeHeap = Heap<Server>(.minHeap)

    for (i, server) in servers.enumerated() {
        freeHeap.push(Server(index: i, weight: server))
    }

    var result = [Int]()
    var time = 0, i = 0

    while i < tasks.count {
        if freeHeap.isEmpty { time = usedHeap.peek()!.time }

        while var first = usedHeap.peek(), first.time <= time {
            usedHeap.pop()
            first.isUsed = false
            freeHeap.push(first)
        }

        while i < tasks.count, time >= i, !freeHeap.isEmpty {
            var freeServer = freeHeap.pop()!
            freeServer.time = time + tasks[i]
            freeServer.isUsed = true
            usedHeap.push(freeServer)
            result.append(freeServer.index)
            i += 1
        }

        time += 1
    }

    return result
}

print(assignTasks([3,3,2], [1,2,3,2,1,2]))
print(assignTasks([5,1,4,3,2], [2,1,2,4,5,2,1]))
print(assignTasks([1,2,3], [5,4,3,1,2]))