// Given an integer array nums and an integer k, 
// return the length of the shortest non-empty subarray of nums 
// with a sum of at least k. If there is no such subarray, return -1.
// A subarray is a contiguous part of an array.

struct Cumulative: Comparable {
    let i: Int
    let sum: Int

    static func < (_ l: Cumulative, _ r: Cumulative) -> Bool {
        return l.sum < r.sum
    }
}

// Time: O(n * log(n)), Space: O(n)
func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
    var result = Int.max
    var totalSum = 0
    var heap = Heap<Cumulative>(.minHeap)

    for (i, number) in nums.enumerated() {
        totalSum += number

        if totalSum >= k { result = min(result, i + 1) }

        while let smallest = heap.peek(), totalSum - smallest.sum >= k {
            heap.pop()
            result = min(result, i - smallest.i)
        }

        heap.push(Cumulative(i: i, sum: totalSum))
    }

    return result == Int.max ? -1 : result
}

print(shortestSubarray([1], 1))
print(shortestSubarray([1,2], 4))
print(shortestSubarray([2,-1,2], 3))