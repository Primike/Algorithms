// Given a linked list, swap every two adjacent nodes and return its head. 
// You must solve the problem without modifying the values 
// in the list's nodes (i.e., only nodes themselves may be changed.)

func swapPairs(_ head: ListNode?) -> ListNode? {
    let newNode = ListNode(0, head)
    var previous: ListNode? = newNode
    var current: ListNode? = head

    while let currentNode = current, let next = currentNode.next {
        let nextPair = next.next
        let nextNode = next

        previous?.next = nextNode
        nextNode.next = currentNode
        currentNode.next = nextPair

        previous = currentNode
        current = nextPair
    }

    return newNode.next
}
