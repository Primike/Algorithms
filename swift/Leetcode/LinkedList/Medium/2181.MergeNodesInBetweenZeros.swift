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
    var previous: ListNode? = nil
    var current = head

    while let node = current, node.next != nil {
        var right = current?.next
        var sum = 0

        while let next = right, next.val != 0  {
            sum += next.val
            right = next.next
        }

        current?.val = sum
        current?.next = right
        previous = current
        current = right
    }

    previous?.next = nil
    return head
}


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