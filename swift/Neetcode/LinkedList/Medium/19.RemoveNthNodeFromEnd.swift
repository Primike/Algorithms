//Given the head of a linked list, remove the nth node from the end of the list 
//and return its head.

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let newNode = ListNode(0)
    newNode.next = head
    var left: ListNode? = newNode, right = head

    for _ in 0..<n {
        right = right?.next
    }

    while let rightNode = right {
        left = left?.next
        right = rightNode.next
    }

    left?.next = left?.next?.next
    return newNode.next
}
