// Remove every node which has a node with a greater value 
// anywhere to the right side of it.
// Return the head of the modified linked list.

// Time: O(n), Space: O(1)
func removeNodes(_ head: ListNode?) -> ListNode? {
    var previous: ListNode? = nil
    var current = head

    while let node = current {
        let next = node.next
        node.next = previous
        previous = node
        current = next
    }

    let firstNode = previous
    var largest = previous?.val ?? Int.min
    current = previous?.next

    while let node = current {
        let next = node.next

        if node.val < largest {
            previous?.next = next
            current = next 
        } else {
            previous = current
            current = next
            largest = node.val
        }
    }

    previous = nil
    current = firstNode

    while let node = current {
        let next = node.next
        node.next = previous
        previous = node
        current = next
    }

    return previous
}