// Given the head of a linked list and an integer val, 
// remove all the nodes of the linked list that has Node.val == val, 
// and return the new head.

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let newHead = ListNode(0, head)
    var previous: ListNode? = newHead
    var current = head

    while let node = current {
        let next = node.next

        if node.val == val {
            previous?.next = next
        } else {
            previous = current
        }

        current = next
    }

    return newHead.next
}