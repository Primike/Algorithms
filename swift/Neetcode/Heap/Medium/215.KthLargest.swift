// Given an integer array nums and an integer k, return the kth largest element in the array.

// Time: O(n * log(k)), Space: O(k)
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap<Int>(.minHeap)

    for number in nums {
        if heap.count < k {
            heap.push(number)
        } else if let first = heap.peek(), first < number {
            heap.pop()
            heap.push(number)
        }
    }

    return heap.peek() ?? 0
}

print(findKthLargest([3,2,1,5,6,4], 2))
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))