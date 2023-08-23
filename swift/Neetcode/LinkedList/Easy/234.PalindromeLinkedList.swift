// Given the head of a singly linked list, return true if it is a 
// palindrome or false otherwise.

//End node is shared both lists converge to last node
func isPalindrome(_ head: ListNode?) -> Bool {
    var slow = head, fast = head

    while let fastNode = fast, let nextNode = fastNode.next {
        slow = slow?.next
        fast = nextNode.next
    }

    var previous: ListNode? = nil

    while let current = slow {
        var next = current.next
        current.next = previous
        previous = current
        slow = next
    }

    var left = head, right = previous

    while let leftNode = left, let rightNode = right {
        if leftNode.val != rightNode.val {
            return false
        }

        left = leftNode.next
        right = rightNode.next
    }

    return true
}
