// Given an array of integers nums and an integer limit, 
// return the size of the longest non-empty subarray such that 
// the absolute difference between any two elements of this subarray 
// is less than or equal to limit.

struct Num: Comparable {
    let i: Int
    let number: Int

    static func < (_ l: Num, _ r: Num) -> Bool {
        if l.number == r.number { return l.i < r.i }
        return l.number < r.number
    }
}

// Time: O(n * log(n)), Space: O(n)
func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var minHeap = Heap<Num>(.minHeap)
    var maxHeap = Heap<Num>(.maxHeap)
    var result = 0
    var left = 0

    for i in 0..<nums.count {
        minHeap.push(Num(i: i, number: nums[i]))
        maxHeap.push(Num(i: i, number: nums[i]))

        while let n1 = minHeap.peek(), let n2 = maxHeap.peek(), n2.number - n1.number > limit {
            left = min(n1.i, n2.i)

            while let first = minHeap.peek(), first.i <= left {
                minHeap.pop()
            }

            while let first = maxHeap.peek(), first.i <= left {
                maxHeap.pop()
            }

            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(longestSubarray([8,2,4,7], 4))
print(longestSubarray([10,1,2,4,7,2], 5))
print(longestSubarray([4,2,2,2,4,4,2,2], 0))