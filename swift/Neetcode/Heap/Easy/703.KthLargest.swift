//Time: nlog(k), Space: k
class KthLargest {
    private var k: Int
    private var minHeap: Heap<Int>

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.minHeap = Heap(type: .minHeap)
        
        for number in nums {
            add(number)
        }
    }

    func add(_ val: Int) -> Int {
        if minHeap.count < k {
            minHeap.push(val)
        } else if let smallest = minHeap.peek(), val > smallest {
            minHeap.pop()
            minHeap.push(val)
        }
        
        return minHeap.peek()!
    }
}