// Return the least number of units of times that 
// the CPU will take to finish all the given tasks.

struct Task: Comparable {
    let letter: Character
    var count: Int
    var time: Int

    static func < (_ l: Task, _ r: Task) -> Bool {
        return l.count < r.count
    }
}

// Time: O(n * m * log26), Space: O(26)
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var letterCount = tasks.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Task>(.maxHeap)

    for (key, value) in letterCount {
        heap.push(Task(letter: key, count: value, time: 0))
    }

    var queue = [Task]()
    var time = 0

    while !heap.isEmpty || !queue.isEmpty {
        if heap.isEmpty { time = max(time, queue.first!.time) }

        while let first = queue.first, first.time <= time {
            heap.push(queue.removeFirst())
        }

        var largest = heap.pop()!
        largest.count -= 1
        largest.time = time + n + 1

        if largest.count > 0 { queue.append(largest) }

        time += 1
    }

    return time
}

print(leastInterval(["A","A","A","B","B","B"], 2))
print(leastInterval(["A","A","A","B","B","B"], 0))
print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))


func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
    let dict = tasks.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap(.maxHeap, Array(dict.values))
    var queue = [(Int, Int)]()
    var time = 0

    while !queue.isEmpty || !heap.isEmpty {
        time += 1

        if let largest = heap.pop() {
            if largest > 1 { queue.append((largest - 1, time + n)) }
        }

        if let first = queue.first, first.1 == time {
            heap.push(first.0)
            queue.removeFirst()
        }
    }

    return time
}