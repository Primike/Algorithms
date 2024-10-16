class Node {
    var val: Int
    var next: Node?
    var prev: Node?

    init(_ val: Int, _ next: Node? = nil, _ prev: Node? = nil) {
        self.val = val
        self.next = next
        self.prev = prev
    }
}

class MyCircularDeque {

    private var head: Node?
    private var rear: Node?
    private let capacity: Int
    private var size: Int

    init(_ k: Int) {
        self.size = 0
        self.capacity = k
        self.head = nil
        self.rear = nil
    }

    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        
        if head == nil {
            head = Node(value)
            rear = head
        } else {
            let newHead = Node(value, head, nil)
            head?.prev = newHead
            head = newHead
        }

        size += 1
        return true
    }

    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }

        if head == nil {
            head = Node(value)
            rear = head
        } else {
            let newRear = Node(value, nil, rear)
            rear?.next = newRear
            rear = newRear
        }

        size += 1
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() { return false }

        if size == 1 {
            head = nil
            rear = nil
        } else {
            head = head?.next
            head?.prev = nil
        }

        size -= 1
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() { return false }
        
        if size == 1 {
            head = nil
            rear = nil
        } else {
            rear = rear?.prev
            rear?.next = nil
        }

        size -= 1
        return true
    }

    func getFront() -> Int {
        return isEmpty() ? -1 : head!.val
    }

    func getRear() -> Int {
        return isEmpty() ? -1 : rear!.val
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    func isFull() -> Bool {
        return size == capacity
    }
}