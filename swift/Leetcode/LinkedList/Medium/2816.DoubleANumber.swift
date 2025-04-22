// You are given the head of a non-empty linked list representing 
// a non-negative integer without leading zeroes.
// Return the head of the linked list after doubling it.

// Time: O(n), Space: O(1)
func doubleIt(_ head: ListNode?) -> ListNode? {
    var list = head
    var current = head

    if (current?.val ?? 0) >= 5 { list = ListNode(1, head) }

    while let node = current {
        var value = (node.val * 2) % 10
        
        if let next = node.next, next.val >= 5 { value += 1 }

        current?.val = value
        current = node.next
    }

    return list
}

func doubleIt2(_ head: ListNode?) -> ListNode? {
    var current = head
    var previous: ListNode? = nil 

    while let node = current {
        let next = node.next
        current?.next = previous
        previous = current
        current = next
    }

    let newHead = ListNode()
    var carry = 0
    var oldList = previous
    var newList = newHead

    while let node = oldList {
        let number = node.val * 2
        let newNode = ListNode((number + carry) % 10, nil)
        newList.next = newNode

        carry = number >= 10 ? 1 : 0 
        oldList = node.next
        newList = newNode
    }

    if carry > 0 { newList.next = ListNode(1, nil) }
    current = newHead.next
    previous = nil 

    while let node = current {
        let next = node.next
        current?.next = previous
        previous = current
        current = next
    }

    return previous
}