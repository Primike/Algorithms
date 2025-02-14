// You are given a 0-indexed integer array nums, and an integer k.
// In one operation, you will:
// Take the two smallest integers x and y in nums.
// Remove x and y from nums.
// Add min(x, y) * 2 + max(x, y) anywhere in the array.
// Return the minimum number of operations needed so that all elements 
// of the array are greater than or equal to k.

// Time: O(n * log(n)), Space: O(n)
func minOperations(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap<Int>(.minHeap, nums)
    var result = 0

    while heap.count >= 2, heap.peek()! < k {
        let first = heap.pop()!
        let second = heap.pop()!
        heap.push(min(first, second) * 2 + max(first, second))
        result += 1
    }

    return result
}

print(minOperations([2,11,10,1,3], 10))
print(minOperations([1,1,2,4,9], 20))