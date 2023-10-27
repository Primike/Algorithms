class MyCircularQueue {
    private var queue: [Int]
    private var front: Int = 0
    private var rear: Int = -1
    private var count: Int = 0

    init(_ k: Int) {
        self.queue = Array(repeating: -1, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }

        rear = (rear + 1) % queue.count
        queue[rear] = value
        count += 1
        
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() { return false }

        queue[front] = -1
        front = (front + 1) % queue.count
        count -= 1

        return true
    }
    
    func Front() -> Int {
        return isEmpty() ? -1 : queue[front]
    }
    
    func Rear() -> Int {
        return isEmpty() ? -1 : queue[rear]
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func isFull() -> Bool {
        return count == queue.count
    }
}