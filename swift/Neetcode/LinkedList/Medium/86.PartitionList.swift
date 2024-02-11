// Given the head of a linked list and a value x, 
// partition it such that all nodes less than x come before nodes 
// greater than or equal to x.
// You should preserve the original relative order of the nodes 
// in each of the two partitions.

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var leftList = ListNode(), rightList = ListNode()
    var left = leftList, right = rightList
    var current = head

    while let node = current {
        if node.val < x {
            left.next = node
            left = node
        } else {
            right.next = node
            right = node
        }

        current = node.next
    }

    right.next = nil
    left.next = rightList.next

    return leftList.next
}

func partition2(_ head: ListNode?, _ x: Int) -> ListNode? {
    let newHead = ListNode(.min, head)
    var left: ListNode? = nil
    var current: ListNode? = newHead

    while let node = current, node.val < x {
        left = node
        current = node.next
    }

    while let next = current?.next {
        if next.val < x {
            let next2 = next.next
            let right = left?.next
            left?.next = next
            next.next = right
            current?.next = next2
            left = left?.next
        } else {
            current = current?.next
        }
    }

    return newHead.next
}