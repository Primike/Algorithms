//Given the head of a singly linked list, reverse the list, 
//and return the reversed list.

func reverseList(_ head: ListNode?) -> ListNode? {
    var previous: ListNode? = nil
    var current = head

    while let currentNode = current {
        let next = currentNode.next
        currentNode.next = previous

        previous = currentNode
        current = next
    }

    return previous
}

//[1,2,3,4,5]