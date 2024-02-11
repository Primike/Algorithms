class Node {
    let key: Int
    var value: Int
    var previous: Node?
    var next: Node?

    init(_ key: Int, _ value: Int, _ previous: Node? = nil, _ next: Node? = nil ) {
        self.key = key
        self.value = value
        self.previous = previous
        self.next = next
    }
}

class LRUCache {
    let capacity: Int
    var count: Int
    var cache: [Int: Node]
    let head: Node
    let tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.count = 0
        self.cache = [:]
        self.head = Node(0, 0)
        self.tail = Node(0, 0)

        self.head.next = self.tail
        self.tail.previous = self.head
    }
    
    func remove(_ old: Node?) {
        let previous = old?.previous
        let next = old?.next

        previous?.next = next
        next?.previous = previous
        count -= 1
    }

    func insert(_ old: Node) {
        let last = self.tail.previous
        old.previous = last
        old.next = self.tail

        last?.next = old
        self.tail.previous = old
        count += 1
    }

    func get(_ key: Int) -> Int {
        if let old = self.cache[key] {
            self.remove(old)
            self.insert(old)
            return old.value
        } 

        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let old = self.cache[key] { self.remove(old) }

        let new = Node(key, value, nil, nil)
        self.insert(new)
        self.cache[key] = new

        if self.count > self.capacity, let lru = self.head.next {
            self.remove(lru)
            self.cache[lru.key] = nil
        }
    }
}