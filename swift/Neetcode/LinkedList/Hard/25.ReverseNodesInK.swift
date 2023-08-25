// Given the head of a linked list, reverse the nodes of the list k at a time, 
// and return the modified list.

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var newNode = ListNode(0, head)
    var left: ListNode? = newNode, right = head

    for i in 0..<(k - 1) {
        right = right?.next
    }

    while right != nil {
        var newLeft = left?.next
        var current = left?.next
        var previous: ListNode? = nil

        for _ in 0..<k {
            var next = current?.next 
            current?.next = previous
            previous = current
            current = next 
        }

        left?.next?.next = current
        left?.next = previous

        left = newLeft
        right = current

        for _ in 0..<(k - 1) {
            right = right?.next
        }
    }
    
    return newNode.next
}