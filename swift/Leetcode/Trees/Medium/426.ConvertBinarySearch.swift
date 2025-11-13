// Convert a Binary Search Tree to a sorted 
// Circular Doubly-Linked List in place.
// You can think of the left and right pointers as 
// synonymous to the predecessor and successor pointers 
// in a doubly-linked list. For a circular doubly linked list, 
// the predecessor of the first element is the last element, 
// and the successor of the last element is the first element.
// We want to do the transformation in place. 
// After the transformation, the left pointer of the tree node 
// should point to its predecessor, and the right pointer 
// should point to its successor. You should return the pointer 
// to the smallest element of the linked list.

// Time: O(n), Space: O(h)
func treeToDoublyList(_ root: Node?) -> Node? {
    guard let root else { return nil }

    var newNode = Node(0)
    var previous: Node? = newNode
    var current: Node? = root
    var stack = [Node]()

    while current != nil || !stack.isEmpty {
        while let node = current {
            stack.append(node)
            current = node.left
        }

        current = stack.removeLast()
        current?.left = previous
        previous?.right = current
        previous = current
        current = current?.right
    }

    newNode.right?.left = previous
    previous?.right = newNode.right
    return newNode.right
}

// Time: O(n), Space: O(h)
func treeToDoublyList2(_ root: Node?) -> Node? {
    var newNode = Node(0)
    var previous = newNode

    func dfs(_ root: Node?) {
        guard let root else { return }

        dfs(root.left)
        previous.right = root
        root.left = previous
        previous = root
        dfs(root.right)
    }

    dfs(root)
    newNode.right?.left = previous
    previous.right = newNode.right
    return newNode.right
}