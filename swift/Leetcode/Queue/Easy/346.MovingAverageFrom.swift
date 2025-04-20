// Given a stream of integers and a window size, 
// calculate the moving average of all integers in the sliding window.
// Implement the MovingAverage class:
// MovingAverage(int size) Initializes the object with the size of the window size.
// double next(int val) Returns the moving average of the last size values of the stream.

// Time: O(n), Space: O(n)
class MovingAverage {

    private var queue: [Int]
    private var total: Int
    private let size: Int

    init(_ size: Int) {
        self.queue = []
        self.total = 0
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        if queue.count == size { total -= queue.removeFirst() }
        
        queue.append(val)
        total += val
        
        return Double(total) / Double(min(size, queue.count))
    }
}