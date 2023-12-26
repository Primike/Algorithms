// Given head, the head of a linked list, determine if the linked list has a cycle.

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head, right = head

    while let next = right?.next {
        slow = slow?.next
        right = next.next
        
        if slow === right { return true }
    }

    return false
}