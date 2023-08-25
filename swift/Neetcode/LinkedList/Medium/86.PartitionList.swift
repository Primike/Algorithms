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