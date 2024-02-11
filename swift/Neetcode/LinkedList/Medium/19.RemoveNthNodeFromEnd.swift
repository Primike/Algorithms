// Given the head of a linked list, remove the nth node from the end of the list 
// and return its head.

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let newHead = ListNode(0, head)
    var slow: ListNode? = newHead, fast = head

    for _ in 0..<n {
        fast = fast?.next
    }

    while fast != nil {
        slow = slow?.next
        fast = fast?.next
    }

    slow?.next = slow?.next?.next
    return newHead.next
}