class SeatManager {
    var minHeap: Heap<Int>

    init(_ n: Int) {
        self.minHeap = Heap(type: .minHeap)
        
        for i in 1...n {
            self.minHeap.push(i)
        }
    }
    
    func reserve() -> Int {
        return self.minHeap.pop()!
    }
    
    func unreserve(_ seatNumber: Int) {
        self.minHeap.push(seatNumber)
    }
}