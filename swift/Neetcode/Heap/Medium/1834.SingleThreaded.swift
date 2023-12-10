struct CPUTask: Comparable {
    enum TaskType {
        case enqueue
        case process
    }

    let eqT: Int
    let psT: Int
    let index: Int
    var type: TaskType = .enqueue

    static func <(left: CPUTask, right: CPUTask) -> Bool {
        switch left.type {
        case .enqueue:
            return (left.eqT, left.psT, left.index) < (right.eqT, right.psT, right.index)
        case .process:
            return (left.psT, left.index) < (right.psT, right.index)
        }
    }
}

// Time: nlog(n), Space: n
func getOrder(_ tasks: [[Int]]) -> [Int] {
    var enqueueHeap = Heap<CPUTask>(type: .minHeap)
    var processHeap = Heap<CPUTask>(type: .minHeap)

    for (i, task) in tasks.enumerated() {
        enqueueHeap.push(CPUTask(eqT: task[0], psT: task[1], index: i))
    }

    var result = [Int]()
    var time = 0

    while !enqueueHeap.isEmpty || !processHeap.isEmpty {
        while var task = enqueueHeap.peek(), task.eqT <= time {
            task.type = .process
            processHeap.push(task)
            enqueueHeap.pop()
        }

        if let task = processHeap.pop() {
            time += task.psT
            result.append(task.index)
        } else {
            time = enqueueHeap.peek()?.eqT ?? 0
        }
    }

    return result
}

print(getOrder([[1,2],[2,4],[3,2],[4,1]]))
print(getOrder([[7,10],[7,12],[7,5],[7,4],[7,2]]))