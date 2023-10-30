class Node {
    var key: Int
    var val: Int
    var previous: Node?
    var next: Node?

    init(_ key: Int, _ val: Int, _ previous: Node?, _ next: Node?) {
        self.key = key
        self.val = val
        self.previous = previous
        self.next = next
    }
}

class LRUCache {
    var capacity: Int
    var cache: [Int: Node]
    var left: Node
    var right: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]

        self.left = Node(0, 0, nil, nil)
        self.right = Node(0, 0, nil, nil)

        self.left.next = self.right
        self.right.previous = self.left
    }
    
    func remove(_ node: Node?) {
        var previous = node?.previous
        var next = node?.next

        previous?.next = next
        next?.previous = previous
    }

    func insert(_ node: Node) {
        node.previous = self.right.previous
        node.next = self.right

        self.right.previous?.next = node
        self.right.previous = node
    }

    func get(_ key: Int) -> Int {
        if let node = self.cache[key] {
            self.remove(node)
            self.insert(node)
            return node.val
        } 

        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingNode = self.cache[key] {
            self.remove(existingNode)
        }

        let newNode = Node(key, value, nil, nil)
        self.insert(newNode)
        self.cache[key] = newNode

        if self.cache.count > self.capacity, let lru = self.left.next {
            self.remove(lru)
            self.cache.removeValue(forKey: lru.key)
        }
    }
}