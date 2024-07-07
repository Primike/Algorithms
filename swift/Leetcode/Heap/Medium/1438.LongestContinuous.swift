// Given an array of integers nums and an integer limit, 
// return the size of the longest non-empty subarray such that 
// the absolute difference between any two elements of this subarray 
// is less than or equal to limit.

struct Num: Comparable {
    let number: Int
    let i: Int

    static func < (_ l: Num, _ r: Num) -> Bool {
        if l.number == r.number { return l.i < r.i }
        return l.number < r.number
    }
}

func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var minHeap = Heap<Num>(.minHeap), maxHeap = Heap<Num>(.maxHeap)
    var result = 0
    var left = 0

    for (i, number) in nums.enumerated() {
        minHeap.push(Num(number: number, i: i))
        maxHeap.push(Num(number: number, i: i))

        while let s = minHeap.peek(), let l = maxHeap.peek(), l.number - s.number > limit {
            left = min(s.i, l.i) + 1

            while let s = minHeap.peek(), s.i < left {
                minHeap.pop()
            }

            while let l = maxHeap.peek(), l.i < left {
                maxHeap.pop()
            }
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(longestSubarray([8,2,4,7], 4))
print(longestSubarray([10,1,2,4,7,2], 5))
print(longestSubarray([4,2,2,2,4,4,2,2], 0))