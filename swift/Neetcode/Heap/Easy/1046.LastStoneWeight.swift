// Return the weight of the last remaining stone. If there are no stones left, return 0.

//Time: nlog(n), Space: n
func lastStoneWeight(_ stones: [Int]) -> Int {
    var heap = Heap(array: stones, type: .maxHeap)

    while heap.count > 1 {
        let first = heap.pop()!, second = heap.pop()!

        if first != second { heap.push(first - second) }
    }  

    return heap.peek() ?? 0
}

print(lastStoneWeight([2,7,4,1,8,1]))
print(lastStoneWeight([1]))