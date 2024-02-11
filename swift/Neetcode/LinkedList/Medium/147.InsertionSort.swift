// Given the head of a singly linked list, sort the list using 
// insertion sort, and return the sorted list's head.

func insertionSortList(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode()
    var current = head

    while let node = current {
        let listNext = node.next
        var sorted = newHead

        while let next = sorted.next, next.val <= node.val {
            sorted = next
        }

        current?.next = sorted.next
        sorted.next = current
        current = listNext
    }

    return newHead.next
}