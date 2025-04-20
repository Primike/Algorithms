// Design your implementation of the circular double-ended queue (deque).

class Node {
    var value: Int
    var previous: Node?
    var next: Node?

    init(_ value: Int, _ previous: Node? = nil, _ next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

class MyCircularDeque {

    private var head: Node
    private var tail: Node
    private let k: Int
    private var count: Int

    init(_ k: Int) {
        self.head = Node(0)
        self.tail = Node(0)
        self.k = k
        self.count = 0
        self.head.next = self.tail
        self.tail.previous = self.head
    }
    
    func insertFront(_ value: Int) -> Bool {
        if count == k { return false }

        let firstNode = head.next
        let newNode = Node(value, head, firstNode)
        head.next = newNode
        firstNode?.previous = newNode
        count += 1

        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if count == k { return false }

        let lastNode = tail.previous
        let newNode = Node(value, lastNode, tail)
        tail.previous = newNode
        lastNode?.next = newNode
        count += 1

        return true
    }
    
    func deleteFront() -> Bool {
        if count == 0 { return false }

        head.next = head.next?.next
        head.next?.previous = head
        count -= 1

        return true
    }
    
    func deleteLast() -> Bool {
        if count == 0 { return false }

        tail.previous = tail.previous?.previous
        tail.previous?.next = tail
        count -= 1

        return true
    }
    
    func getFront() -> Int {
        if count == 0 { return -1 }
        return head.next?.value ?? -1
    }
    
    func getRear() -> Int {
        if count == 0 { return -1 }
        return tail.previous?.value ?? -1
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func isFull() -> Bool {
        return count == k
    }
}