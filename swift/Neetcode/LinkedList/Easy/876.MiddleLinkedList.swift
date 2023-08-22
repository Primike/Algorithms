// Given the head of a singly linked list, return the middle node of the linked list.
// If there are two middle nodes, return the second middle node.

func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head

    while let fastNode = fast, let next = fastNode.next {
        slow = slow?.next
        fast = next.next
    }

    return slow
}
