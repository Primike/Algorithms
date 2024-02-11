// You are given the head of a singly linked-list. The list can be represented as:
// L0 → L1 → … → Ln - 1 → Ln
// Reorder the list to be on the following form:
// L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

func reorderList(_ head: ListNode?) {
    var slow = head, fast = head

    while let next = fast?.next {
        slow = slow?.next
        fast = next.next
    }

    var previous: ListNode? = nil
    var current = slow

    while current != nil {
        let next = current?.next
        current?.next = previous
        previous = current
        current = next
    }

    var left = head, right = previous

    while right != nil {
        let next1 = left?.next
        let next2 = right?.next

        left?.next = right
        right?.next = next1
        left = next1
        right = next2
    }

    left?.next = nil
}