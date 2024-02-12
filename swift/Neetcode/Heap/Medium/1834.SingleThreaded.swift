struct Task: Comparable {
    let index: Int
    let pTime: Int

    static func <(_ l: Task, _ r: Task) -> Bool {
        return (l.pTime, l.index) < (r.pTime, r.index)
    }
}

// Time: nlog(n), Space: n
func getOrder(_ tasks: [[Int]]) -> [Int] {
    var queue = [(Int, Int, Int)]()

    for (i, task) in tasks.enumerated() {
        queue.append((task[0], task[1], i))
    }

    queue.sort { $0 < $1 }
    var heap = Heap<Task>(.minHeap)
    var result = [Int]()
    var time = queue[0].0, i = 0 

    while i < queue.count || !heap.isEmpty {
        while i < queue.count, queue[i].0 <= time {
            heap.push(Task(index: queue[i].2, pTime: queue[i].1))
            i += 1
        }

        if let first = heap.pop() {
            result.append(first.index)
            time += first.pTime
        } else {
            time = queue[i].0
        }
    }

    return result
}

print(getOrder([[1,2],[2,4],[3,2],[4,1]]))
print(getOrder([[7,10],[7,12],[7,5],[7,4],[7,2]]))