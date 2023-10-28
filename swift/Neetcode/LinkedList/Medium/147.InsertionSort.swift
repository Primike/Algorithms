func insertionSortList(_ head: ListNode?) -> ListNode? {
    let newNode = ListNode(0)
    var current = head

    while current != nil {
        let nextNode = current?.next
        var position: ListNode? = newNode

        while let next = position?.next, next.val < current!.val {
            position = position?.next
        }

        current?.next = position?.next
        position?.next = current
        current = nextNode
    }

    return newNode.next
}