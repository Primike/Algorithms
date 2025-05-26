class Solution {
    func maxRemoval(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var queries = queries
        queries.sort { $0[0] < $1[0] }
        var heap = Heap<Int>(.maxHeap)
        var deltaArray = Array(repeating: 0, count: nums.count + 1)
        var operations = 0
        var j = 0
        for (i, num) in nums.enumerated() {
            operations += deltaArray[i]
            while j < queries.count && queries[j][0] == i {
                heap.push(queries[j][1])
                j += 1
            }
            while operations < num, let end = heap.peek(), end >= i {
                operations += 1
                let e = heap.pop()!
                deltaArray[e + 1] -= 1
            }
            if operations < num {
                return -1
            }
        }
        return heap.count
    }
}