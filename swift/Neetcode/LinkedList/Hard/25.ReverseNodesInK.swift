// Given the head of a linked list, reverse the nodes of the list k at a time, 
// and return the modified list.

// Time: O(n), Space: O(1)
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let newHead = ListNode(0, head)
    var previous: ListNode? = newHead
    var current = head

    while current != nil {
        var temp = current

        for i in 0..<(k - 1) {
            temp = temp?.next
        }

        if temp == nil { return newHead.next }

        var left = previous
        var i = 0

        while let node = current, i < k {
            let next = node.next
            node.next = left
            left = current 
            current = next
            i += 1
        }
        
        let right = previous?.next
        previous?.next = left
        right?.next = current
        previous = right
    }

    return newHead.next
}