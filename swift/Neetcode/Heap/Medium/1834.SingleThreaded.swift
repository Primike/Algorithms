struct Task: Comparable {
    var et: Int
    var pt: Int
    var i: Int
    
    static func < (lhs: Task, rhs: Task) -> Bool {
        if lhs.et == rhs.et {
            if lhs.pt == rhs.pt { return lhs.i < rhs.i }
            return lhs.pt < rhs.pt
        }

        return lhs.et < rhs.et
    }
}

func getOrder(_ tasks: [[Int]]) -> [Int] {
    var enqueueHeap = Heap<Task>(type: .minHeap)
    var processHeap = Heap<Task>(type: .minHeap)

    for (i, task) in tasks.enumerated() {
        enqueueHeap.push(Task(et: task[0], pt: task[1], i: i))
    }

    var result = [Int]()
    var time = 0

    while !enqueueHeap.isEmpty || !processHeap.isEmpty {
        while let task = enqueueHeap.peek(), task.et <= time {
            processHeap.push(Task(et: task.pt, pt: task.i, i: task.et))
            enqueueHeap.pop()
        }

        if let task = processHeap.pop() {
            time += task.et
            result.append(task.pt)
        } else {
            time = enqueueHeap.peek()?.et ?? 0
        }
    }

    return result
}

print(getOrder([[1,2],[2,4],[3,2],[4,1]]))
print(getOrder([[7,10],[7,12],[7,5],[7,4],[7,2]]))