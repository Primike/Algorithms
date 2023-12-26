// Given the head of a singly linked list, reverse the list, 
// and return the reversed list.

func reverseList(_ head: ListNode?) -> ListNode? {
    var previous: ListNode? = nil
    var current = head

    while current !== nil {
        let next = current?.next
        current?.next = previous
        previous = current
        current = next
    }

    return previous
}