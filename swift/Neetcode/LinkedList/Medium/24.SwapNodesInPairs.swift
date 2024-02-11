// Given a linked list, swap every two adjacent nodes and return its head. 
// You must solve the problem without modifying the values 
// in the list's nodes (i.e., only nodes themselves may be changed.)

func swapPairs(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode(0, head)
    var previous: ListNode? = newHead, current = head

    while let node = current?.next {
        let next = node.next

        previous?.next = node
        node.next = current 
        current?.next = next

        previous = current
        current = current?.next
    }

    return newHead.next
}