class MyCircularQueue {
    private var queue: [Int]
    private var front: Int
    private var rear: Int
    private let capacity: Int
    private var count: Int

    init(_ k: Int) {
        self.queue = Array(repeating: -1, count: k)
        self.front = 0
        self.rear = -1
        self.capacity = k
        self.count = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }

        rear = (rear + 1) % capacity
        queue[rear] = value
        count += 1
        
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() { return false }

        queue[front] = -1
        front = (front + 1) % capacity
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
        return count == capacity
    }
}