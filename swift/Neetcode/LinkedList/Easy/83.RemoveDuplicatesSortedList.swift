// Given the head of a sorted linked list, 
// delete all duplicates such that each element appears only once. 
// Return the linked list sorted as well.

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head

    while let currentNode = current {
        while let next = currentNode.next, next.val == currentNode.val {
            currentNode.next = next.next
        }

        current = currentNode.next
    }

    return head
}
