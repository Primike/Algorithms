// Return the least number of units of times that 
// the CPU will take to finish all the given tasks.

// Time: nmlog(26), Space: 26
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var taskCount = tasks.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap(array: Array(taskCount.values), type: .maxHeap)
    var queue = [(Int, Int)]()
    var time = 0

    while !queue.isEmpty || !heap.isEmpty {
        time += 1

        if let first = heap.pop() {
            var count = first - 1

            if count > 0 { queue.append((count, time + n)) }
        }

        if let first = queue.first, first.1 == time {
            heap.push(first.0)
            queue.removeFirst()
        }
    }

    return time
}

print(leastInterval(["A","A","A","B","B","B"], 2))
print(leastInterval(["A","A","A","B","B","B"], 0))
print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))