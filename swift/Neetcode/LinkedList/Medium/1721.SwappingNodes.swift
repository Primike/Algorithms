// Return the head of the linked list after swapping the values 
// of the kth node from the beginning and the kth node from the 
// end (the list is 1-indexed).

func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    var current = head

    for _ in 0..<(k - 1) {
        current = current?.next
    }

    var left = head, right = current 

    while let rightNode = right, let next = rightNode.next {
        left = left?.next
        right = next
    }

    if let currentNode = current, let leftNode = left {
        let value = leftNode.val
        leftNode.val = currentNode.val
        currentNode.val = value
    }

    return head
}