// Return the head of the linked list after swapping the values 
// of the kth node from the beginning and the kth node from the 
// end (the list is 1-indexed).

func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    var current = head

    for _ in 0..<(k - 1) {
        current = current?.next
    }

    var left = head, right = current 

    while let next = right?.next {
        left = left?.next
        right = next
    }

    if let node1 = current, let node2 = left {
        let value = node2.val
        node2.val = node1.val
        node1.val = value
    }

    return head
}