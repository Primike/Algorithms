// Given the head of a linked list, we repeatedly delete 
// consecutive sequences of nodes that sum to 0 until there are no such sequences.
// After doing so, return the head of the final linked list.  
// You may return any such answer.

// Time: O(n), Space: O(n)
func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode(0, head)
    var prefixSums = [0: newHead]
    var current = head
    var sum = 0

    while let node = current {
        sum += node.val

        if let previous = prefixSums[sum] {
            var deleted = previous.next
            var key = sum

            while let prefixNode = deleted, prefixNode !== current {
                key += prefixNode.val
                prefixSums[key] = nil
                deleted = prefixNode.next
            }

            previous.next = node.next
        } else {
            prefixSums[sum] = node
        }

        current = node.next
    }

    return newHead.next
}