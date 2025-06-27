// Given a Circular Linked List node, which is sorted in non-descending order, 
// write a function to insert a value insertVal into the list 
// such that it remains a sorted circular list. 
// The given node can be a reference to any single node in the list 
// and may not necessarily be the smallest value in the circular list.
// If there are multiple suitable places for insertion, 
// you may choose any place to insert the new value.
// After the insertion, the circular list should remain sorted.
// If the list is empty (i.e., the given node is null), 
// you should create a new single circular list and 
// return the reference to that single node. 
// Otherwise, you should return the originally given node.

// Time: O(n), Space: O(1)
func insert(_ head: Node?, _ insertVal: Int) -> Node? {
    guard let head = head else {
        let newNode = Node(insertVal)
        newNode.next = newNode
        return newNode
    }

    var previous = head
    var current: Node? = head.next

    while let node = current {
        if (previous.val <= insertVal && insertVal <= node.val) || 
            (previous.val > node.val && 
            (insertVal >= previous.val || insertVal <= node.val)) {
            let newNode = Node(insertVal)
            newNode.next = node
            previous.next = newNode
            return head
        }

        previous = node
        current = node.next
        if previous === head { break }
    }

    let newNode = Node(insertVal)
    newNode.next = current
    previous.next = newNode
    
    return head
}