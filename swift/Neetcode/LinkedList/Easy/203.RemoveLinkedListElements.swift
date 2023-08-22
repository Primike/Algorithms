// Given the head of a linked list and an integer val, 
// remove all the nodes of the linked list that has Node.val == val, 
// and return the new head.

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var newNode = ListNode()
    var previous = newNode
    var current = head

    while let currentNode = current {
        if currentNode.val != val {
            previous.next = currentNode
            previous = currentNode
        }

        current = currentNode.next
    }

    previous.next = nil
    return newNode.next
}
