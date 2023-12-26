// Given the head of a singly linked list, return true if it is a 
// palindrome or false otherwise.

// End node shared both but while logic checks it for even/odd
func isPalindrome(_ head: ListNode?) -> Bool {
    var slow = head, fast = head

    while let next = fast?.next {
        slow = slow?.next
        fast = next.next
    }

    var previous: ListNode? = nil
    var current = slow 

    while current != nil {
        var next = current?.next
        current?.next = previous
        previous = current
        current = next
    }

    var left = head, right = previous

    while let node1 = left, let node2 = right {
        if node1.val != node2.val { return false }

        left = node1.next
        right = node2.next
    }

    return true
}