// A linked list of length n is given such that each node contains an additional 
// random pointer, which could point to any node in the list, or null.
// Construct a deep copy of the list.

// Time: O(n), Space: O(n)
func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }

    var nodes = [Node: Node]()
    var current: Node? = head

    while let node = current {
        let newNode = Node(node.val)
        nodes[node] = newNode
        current = node.next
    }

    var copy: Node? = nodes[head]
    current = head

    while let node = current {
        if node.next != nil { copy?.next = nodes[node.next!] }
        if node.random != nil { copy?.random = nodes[node.random!] }

        current = node.next
        copy = copy?.next
    }

    return nodes[head]
}