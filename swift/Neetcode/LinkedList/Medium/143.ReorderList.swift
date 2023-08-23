//You are given the head of a singly linked-list. The list can be represented as:
//L0 → L1 → … → Ln - 1 → Ln
//Reorder the list to be on the following form:
//L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

//both sides end at the middle node
func reorderList(_ head: ListNode?) {
    var slow = head, fast = head

    while let fastNode = fast, let next = fastNode.next {
        slow = slow?.next
        fast = next.next
    }

    var previous: ListNode? = nil

    while let current = slow {
        var next = current.next
        current.next = previous
        previous = current
        slow = next
    }

    var left = head, right = previous

    while let leftNode = left, let rightNode = right {
        var nextLeft = leftNode.next 
        var nextRight = rightNode.next
        leftNode.next = rightNode
        rightNode.next = nextLeft

        left = nextLeft
        right = nextRight
    }

    //for even lists the last node points to itself
    if let leftNode = left { leftNode.next = nil }
}