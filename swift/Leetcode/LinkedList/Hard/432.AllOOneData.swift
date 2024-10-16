class Node {
    var freq: Int
    var prev: Node?
    var next: Node?
    var keys: Set<String>

    init(_ freq: Int) {
        self.freq = freq
        self.prev = nil
        self.next = nil
        self.keys = Set<String>()
    }
}

class AllOne {

    private var head: Node
    private var tail: Node
    private var map: [String: Node]

    init() {
        self.head = Node(0)
        self.tail = Node(0)
        self.head.next = self.tail
        self.tail.prev = self.head
        self.map = [String: Node]()
    }

    func inc(_ key: String) {
        if let node = map[key] {
            let freq = node.freq
            node.keys.remove(key)

            let nextNode = node.next
            if nextNode === tail || nextNode?.freq != freq + 1 {
                let newNode = Node(freq + 1)
                newNode.keys.insert(key)
                newNode.prev = node
                newNode.next = nextNode
                node.next = newNode
                nextNode?.prev = newNode
                map[key] = newNode
            } else {
                nextNode?.keys.insert(key)
                map[key] = nextNode
            }

            if node.keys.isEmpty { removeNode(node) }
        } else {
            let firstNode = head.next
            if firstNode === tail || firstNode?.freq ?? 0 > 1 {
                let newNode = Node(1)
                newNode.keys.insert(key)
                newNode.prev = head
                newNode.next = firstNode
                head.next = newNode
                firstNode?.prev = newNode
                map[key] = newNode
            } else {
                firstNode?.keys.insert(key)
                map[key] = firstNode
            }
        }
    }

    func dec(_ key: String) {
        guard let node = map[key] else { return }

        node.keys.remove(key)
        let freq = node.freq

        if freq == 1 {
            map.removeValue(forKey: key)
        } else {
            let prevNode = node.prev
            if prevNode === head || prevNode?.freq != freq - 1 {
                let newNode = Node(freq - 1)
                newNode.keys.insert(key)
                newNode.prev = prevNode
                newNode.next = node
                prevNode?.next = newNode
                node.prev = newNode
                map[key] = newNode
            } else {
                prevNode?.keys.insert(key)
                map[key] = prevNode
            }
        }

        if node.keys.isEmpty { removeNode(node) }
    }

    func getMaxKey() -> String {
        if tail.prev === head {
            return ""
        }
        return tail.prev!.keys.first ?? ""
    }

    func getMinKey() -> String {
        if head.next === tail { return "" }
        return head.next!.keys.first ?? ""
    }

    private func removeNode(_ node: Node) {
        let prevNode = node.prev
        let nextNode = node.next
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
    }
}