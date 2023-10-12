struct Server: Comparable {
    let weight: Int
    let index: Int
    var time: Int
    var inUse = false

    static func <(left: Server, right: Server) -> Bool {
        if left.inUse {
            return left.time < right.time
        } else {
            if left.weight == right.weight { return left.index < right.index }
            return left.weight < right.weight
        }
    }
}

func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
    var heap = Heap<Server>(type: .minHeap)
    var inUseHeap = Heap<Server>(type: .minHeap)

    for (i, weight) in servers.enumerated() {
        heap.push(Server(weight: weight, index: i, time: 0))
    }

    var result = [Int]()
    var taskIndex = 0
    var time = 0

    while taskIndex < tasks.count {
        while let inUse = inUseHeap.peek(), inUse.time <= time {
            var server = inUseHeap.pop()!
            server.inUse = false
            heap.push(server)
        }

        while let server = heap.peek(), taskIndex < tasks.count, time >= taskIndex {
            var server = heap.pop()!
            result.append(server.index)
            server.inUse = true
            server.time = time + tasks[taskIndex]
            inUseHeap.push(server)
            taskIndex += 1
        }

        if heap.isEmpty, taskIndex < tasks.count {
            time = inUseHeap.peek()!.time
        } else {
            time += 1
        }
    }

    return result
}

print(assignTasks([3,3,2], [1,2,3,2,1,2]))
print(assignTasks([5,1,4,3,2], [2,1,2,4,5,2,1]))