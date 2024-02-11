// Given the head of a linked list, return the list after sorting it in ascending order.

func sortList(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }

    var slow = head, fast = head
    var previous: ListNode? = nil

    while let next = fast?.next {
        previous = slow
        slow = slow?.next
        fast = next.next
    }

    previous?.next = nil

    var left = sortList(head), right = sortList(slow)
    var newHead = ListNode(), current: ListNode? = newHead

    while let node1 = left, let node2 = right {
        if node1.val > node2.val { 
            current?.next = node2 
            right = node2.next
        } else { 
            current?.next = node1 
            left = node1.next
        }

        current = current?.next
    }

    if left != nil { current?.next = left }
    if right != nil { current?.next = right }

    return newHead.next
}