// You are given the head of a linked list, 
// which contains a series of integers separated by 0's. 
// The beginning and end of the linked list will have Node.val == 0.
// For every two consecutive 0's, merge all the nodes 
// lying in between them into a single node whose value is 
// the sum of all the merged nodes. 
// The modified list should not contain any 0's.
// Return the head of the modified linked list.

// Time: O(n), Space: O(1)
func mergeNodes(_ head: ListNode?) -> ListNode? {
    var current = head?.next

    while current !== nil {
        var first = current
        var sum = 0

        while let node = current, node.val != 0 {
            sum += node.val
            first?.next = node.next
            current = current?.next
        }

        first?.val = sum
        first?.next = current?.next
        current = current?.next
    }

    return head?.next
}

// Time: O(n), Space: O(n)
func mergeNodes2(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode()
    var newNode = newHead
    var current = head?.next
    var sum = 0

    while let node = current {
        sum += node.val

        if node.val == 0 {
            let new = ListNode(sum)
            newNode.next = new
            newNode = new
            sum = 0
        }

        current = node.next
    }

    return newHead.next
}