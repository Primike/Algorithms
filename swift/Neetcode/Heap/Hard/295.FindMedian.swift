class MedianFinder {

    var smallHeap: Heap<Int>
    var largeHeap: Heap<Int>

    init() {
        self.smallHeap = Heap(type: .maxHeap)
        self.largeHeap = Heap(type: .minHeap)
    }
    
    //Time: log(n), Space: n
    func addNum(_ num: Int) {
        smallHeap.push(num)          
        largeHeap.push(smallHeap.pop()!) 
        
        if largeHeap.count > smallHeap.count {
            smallHeap.push(largeHeap.pop()!)
        }
    }
    
    func findMedian() -> Double {
        if largeHeap.count > smallHeap.count {
            return Double(largeHeap.peek()!)
        } else if largeHeap.count < smallHeap.count {
            return Double(smallHeap.peek()!)
        } else {
            return Double((largeHeap.peek()! + smallHeap.peek()!)) / 2
        }
    }
}