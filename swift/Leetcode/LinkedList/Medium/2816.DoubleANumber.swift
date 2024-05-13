// You are given the head of a non-empty linked list representing 
// a non-negative integer without leading zeroes.
// Return the head of the linked list after doubling it.

// 1 pass possible
// Time: O(n), Space: O(1)
func doubleIt(_ head: ListNode?) -> ListNode? {
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