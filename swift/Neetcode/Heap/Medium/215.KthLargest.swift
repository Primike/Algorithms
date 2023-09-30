// Given an integer array nums and an integer k, return the kth largest element in the array.

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap(array: Array(nums.prefix(k)), type: .minHeap)

    for i in k..<nums.count {
        if let first = heap.peek(), first < nums[i] {
            heap.pop()
            heap.push(nums[i])
        }
    }

    return heap.peek() ?? 0
}

print(findKthLargest([3,2,1,5,6,4], 2))
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))