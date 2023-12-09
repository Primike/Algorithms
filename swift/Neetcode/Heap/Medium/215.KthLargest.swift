// Given an integer array nums and an integer k, return the kth largest element in the array.

// Time: nlog(k), Space: k
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap<Int>(type: .minHeap)

    for number in nums {
        if heap.count < k {
            heap.push(number)
        } else {
            if let last = heap.peek(), last < number {
                heap.pop()
                heap.push(number)
            }
        }
    }

    return heap.peek() ?? 0
}

print(findKthLargest([3,2,1,5,6,4], 2))
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))