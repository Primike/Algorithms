// You are given an array of strings nums and an integer k. 
// Each string in nums represents an integer without leading zeros.
// Return the string that represents the kth largest integer in nums.

struct BigNumber: Comparable {
    let number: String

    static func <(_ l: BigNumber, _ r: BigNumber) -> Bool {
        if l.number.count == r.number.count { return l.number < r.number }
        return l.number.count < r.number.count
    }
}

// Time: O(n * logk), Space: O(k)
func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
    var heap = Heap<BigNumber>(.minHeap)

    for number in nums {
        heap.push(BigNumber(number: number))
        if heap.count > k { heap.pop() }
    }

    return heap.peek()?.number ?? ""
}

print(kthLargestNumber(["3","6","7","10"], 4))
print(kthLargestNumber(["2","21","12","1"], 3))
print(kthLargestNumber(["0","0"], 2))