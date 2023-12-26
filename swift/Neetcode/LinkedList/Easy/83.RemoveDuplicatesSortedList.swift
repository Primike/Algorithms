// Given the head of a sorted linked list, 
// delete all duplicates such that each element appears only once. 
// Return the linked list sorted as well.

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head

    while let node = current, let next = node.next {
        if node.val == next.val {
            current?.next = next.next
        } else {
            current = next
        }
    }

    return head
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode(0, head)
    var previous: ListNode? = head
    var current = head?.next

    while let node = current {
        let next = node.next

        if node.val == previous!.val {
            previous?.next = next
            current = next
        } else {
            previous = current
            current = next
        }
    }

    return newHead.next
}