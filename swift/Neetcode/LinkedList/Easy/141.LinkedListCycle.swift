//Given head, the head of a linked list, determine if the linked list has a cycle.

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head, fast = head

    while let fastNode = fast, let next = fastNode.next {
        slow = slow?.next
        fast = next.next

        if slow === fast { return true }
    }

    return false
}