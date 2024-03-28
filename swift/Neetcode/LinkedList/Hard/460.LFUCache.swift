class Node {
    var key: Int
    var value: Int
    var frequency: Int = 1
    var next: Node?
    var prev: Node?
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class DoublyLinkedList {
    var head: Node
    var tail: Node
    
    init() {
        head = Node(0, 0)
        tail = Node(0, 0)
        head.next = tail
        tail.prev = head
    }
    
    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func addToHead(_ node: Node) {
        node.next = head.next
        node.next?.prev = node
        head.next = node
        node.prev = head
    }
    
    var isEmpty: Bool {
        return head.next === tail
    }
}

class LFUCache {
    
    private var nodeMap: [Int: Node]
    private var frequencyMap: [Int: DoublyLinkedList]
    private var capacity: Int
    private var size = 0
    private var minimum = 1
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.nodeMap = [:]
        self.frequencyMap = [:]
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeMap[key] else { return -1 }

        updateFrequency(node)

        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = nodeMap[key] {
            node.value = value
            updateFrequency(node)
        } else {
            if size >= capacity, let evictedKey = removeLFUKey() {
                nodeMap.removeValue(forKey: evictedKey)
                size -= 1
            }

            let newNode = Node(key, value)
            nodeMap[key] = newNode
            addToFrequencyList(newNode, 1)
            size += 1
            
            if minimum != 1 { minimum = 1 }
        }
    }

    private func updateFrequency(_ node: Node) {
        let count = node.frequency        
        frequencyMap[count]?.remove(node)
        
        if count == minimum, frequencyMap[count]?.isEmpty == true { minimum += 1 }
        
        node.frequency += 1
        addToFrequencyList(node, node.frequency)
    }

    private func removeLFUKey() -> Int? {
        guard let list = frequencyMap[minimum], !list.isEmpty else { return nil }

        let nodeToRemove = list.tail.prev!
        list.remove(nodeToRemove)

        return nodeToRemove.key
    }
        
    private func addToFrequencyList(_ node: Node, _ count: Int) {
        if frequencyMap[count] == nil { frequencyMap[count] = DoublyLinkedList() }
        frequencyMap[count]?.addToHead(node)
    }
}