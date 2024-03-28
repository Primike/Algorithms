// A linked list of length n is given such that each node contains an additional 
// random pointer, which could point to any node in the list, or null.
// Construct a deep copy of the list.

// Time: O(n), Space: O(n)
func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }

    var nodes = [Node: Node]()
    var current: Node? = head

    while let node = current {
        nodes[node] = Node(node.val)
        current = current?.next
    }

    current = head

    while let node = current {
        if let next = node.next { nodes[node]?.next = nodes[next] }
        if let random = node.random { nodes[node]?.random = nodes[random] }
        current = current?.next
    }

    return nodes[head] 
}