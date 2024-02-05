// You are given the node to be deleted node. 
// You will not be given access to the first node of head.
// All the values of the linked list are unique, and it is guaranteed 
// that the given node node is not the last node in the linked list.
// Delete the given node.

// Time: O(1), Space: O(1)
func deleteNode(_ node: ListNode?) {
    guard let node = node, let next = node.next else { return }

    let newNext = next.next
    node.val = next.val
    node.next = newNext
}