// Given the head of a linked list, we repeatedly delete 
// consecutive sequences of nodes that sum to 0 until there are no such sequences.
// After doing so, return the head of the final linked list.  
// You may return any such answer.

// Time: O(n), Space: O(n)
func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode(0, head)
    var prefixSum = [0: newHead]
    var head = head
    var currentSum = 0

    while let current = head {
        currentSum += current.val

        if let previous = prefixSum[currentSum] {
            var toDelete = previous.next
            var key = currentSum

            while let deleted = toDelete, deleted !== current {
                key += deleted.val
                prefixSum[key] = nil
                toDelete = deleted.next
            }

            previous.next = current.next
        } else {
            prefixSum[currentSum] = current
        }

        head = current.next
    }

    return newHead.next
}