class Node {
    let value: Int
    var next: Node?

    init(_ value: Int, _ next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class MyCircularQueue {
    private var head: Node?
    private var tail: Node?
    private var capacity: Int
    private var count = 0

    init(_ k: Int) {
        self.capacity = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        if self.count == self.capacity { return false }

        let newNode = Node(value)

        if self.count == 0 {
            self.head = newNode
            self.tail = newNode
        } else {
            self.tail?.next = newNode
            self.tail = newNode
        }

        self.count += 1
        return true
    }
    
    func deQueue() -> Bool {
        if self.count == 0 { return false }

        self.head = self.head?.next
        self.count -= 1

        if self.count == 0 { self.tail = nil }

        return true
    }
    
    func Front() -> Int {
        return self.head?.value ?? -1
    }
    
    func Rear() -> Int {
        return self.tail?.value ?? -1
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func isFull() -> Bool {
        return self.count == self.capacity
    }
}


class MyCircularQueue2 {
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