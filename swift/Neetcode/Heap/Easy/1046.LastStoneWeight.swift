// Return the weight of the last remaining stone. If there are no stones left, return 0.

func lastStoneWeight(_ stones: [Int]) -> Int {
    var heap = Heap(array: stones, type: .maxHeap)

    while heap.size() > 1 {
        let stone1 = heap.pop()!
        let stone2 = heap.pop()!

        if stone1 != stone2 { heap.push(stone1 - stone2) }
    }

    return heap.peek() ?? 0
}

print(lastStoneWeight([2,7,4,1,8,1]))
print(lastStoneWeight([1]))