// Init - Time: O(n * logn), Space: O(n)
// Functions - Time O(logn), Space: O(n)
class SeatManager {

    private var heap: Heap<Int>

    init(_ n: Int) {
        self.heap = Heap(.minHeap, Array(1...n))
    }
    
    func reserve() -> Int {
        return heap.pop() ?? -1
    }
    
    func unreserve(_ seatNumber: Int) {
        heap.push(seatNumber)
    }
}