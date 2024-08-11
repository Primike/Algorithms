// Given the head of a linked list, find all the values that appear 
// more than once in the list and delete the nodes that have any of those values.
// Return the linked list after the deletions.

// Time: O(n), Space: O(n)
func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
    var numbers = [Int: Int]()
    var current = head

    while let node = current {
        numbers[node.val, default: 0] += 1
        current = node.next
    }

    let newHead = ListNode(0, head)
    var previous: ListNode? = newHead
    current = head

    while let node = current {
        let next = node.next

        if numbers[node.val, default: 0] > 1 {
            previous?.next = next
        } else {
            previous = current
        }

        current = next
    }

    return newHead.next
}