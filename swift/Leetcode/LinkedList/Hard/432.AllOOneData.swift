// Implement the AllOne class:
// AllOne() Initializes the object of the data structure.
// inc(String key) Increments the count of the string key by 1. 
// If key does not exist in the data structure, insert it with count 1.
// dec(String key) Decrements the count of the string key by 1. 
// If the count of key is 0 after the decrement, 
// remove it from the data structure. It is guaranteed that 
// key exists in the data structure before the decrement.
// getMaxKey() Returns one of the keys with the maximal count. 
// If no element exists, return an empty string "".
// getMinKey() Returns one of the keys with the minimum count. 
// If no element exists, return an empty string "".
// Note that each function must run in O(1) average time complexity.

class Node {
    var count: Int
    var previous: Node?
    var next: Node?
    var keysForCount: Set<String>

    init(_ count: Int, _ previous: Node? = nil, _ next: Node? = nil) {
        self.count = count
        self.previous = previous
        self.next = next
        self.keysForCount = []
    }
}

// Time: O(1), Space: O(n)
class AllOne {

    private var head: Node
    private var tail: Node
    private var keyToNode: [String: Node]

    init() {
        self.head = Node(0)
        self.tail = Node(0)
        self.head.next = self.tail
        self.tail.previous = self.head
        self.keyToNode = [String: Node]()
    }

    func inc(_ key: String) {
        if let node = keyToNode[key] {
            node.keysForCount.remove(key)
            let next = node.next

            if next === tail || next?.count != node.count + 1 {
                let newNode = Node(node.count + 1, node, next)
                node.next = newNode
                next?.previous = newNode
                newNode.keysForCount.insert(key)
                keyToNode[key] = newNode
            } else {
                next?.keysForCount.insert(key)
                keyToNode[key] = next
            }

            if node.keysForCount.isEmpty { removeNode(node) }
        } else {
            let node = head.next

            if node === tail || node?.count ?? 0 > 1 {
                let newNode = Node(1, head, node)
                head.next = newNode
                node?.previous = newNode
                newNode.keysForCount.insert(key)
                keyToNode[key] = newNode
            } else {
                node?.keysForCount.insert(key)
                keyToNode[key] = node
            }
        }
    }

    func dec(_ key: String) {
        guard let node = keyToNode[key] else { return }

        node.keysForCount.remove(key)

        if node.count == 1 {
            keyToNode.removeValue(forKey: key)
        } else {
            let previous = node.previous

            if previous === head || previous?.count != node.count - 1 {
                let newNode = Node(node.count - 1, previous, node)
                previous?.next = newNode
                node.previous = newNode
                newNode.keysForCount.insert(key)
                keyToNode[key] = newNode
            } else {
                previous?.keysForCount.insert(key)
                keyToNode[key] = previous
            }
        }

        if node.keysForCount.isEmpty { removeNode(node) }
    }

    func getMaxKey() -> String {
        guard let node = tail.previous, node !== head else { return "" }
        return node.keysForCount.first ?? ""
    }

    func getMinKey() -> String {
        guard let node = head.next, node !== tail else { return "" }
        return node.keysForCount.first ?? ""
    }

    private func removeNode(_ node: Node) {
        let previous = node.previous
        let next = node.next
        previous?.next = next
        next?.previous = previous
    }
}