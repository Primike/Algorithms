class MedianFinder {

    private var minHeap: Heap<Int>
    private var maxHeap: Heap<Int>

    init() {
        self.minHeap = Heap<Int>(.minHeap)
        self.maxHeap = Heap<Int>(.maxHeap)
    }
    
    func addNum(_ num: Int) {
        if let first = maxHeap.peek(), first >= num {
            maxHeap.push(num)
        } else {
            minHeap.push(num)
        }

        balanceHeaps()
    }
    
    func findMedian() -> Double {
        if maxHeap.isEmpty { return Double(minHeap.peek() ?? 0) }

        if minHeap.count > maxHeap.count {
            return Double(minHeap.peek() ?? 0)
        } else if maxHeap.count > minHeap.count {
            return Double(maxHeap.peek() ?? 0)
        } else {
            return (Double(minHeap.peek() ?? 0) + Double(maxHeap.peek() ?? 0)) / 2.0
        }
    }

    private func balanceHeaps() {
        while minHeap.count > maxHeap.count + 1 {
            maxHeap.push(minHeap.pop()!)
        }

        while maxHeap.count > minHeap.count + 1 {
            minHeap.push(maxHeap.pop()!)
        }
    }
}