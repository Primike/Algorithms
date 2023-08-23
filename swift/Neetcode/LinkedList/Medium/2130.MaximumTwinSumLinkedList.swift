// For example, if n = 4, then node 0 is the twin of node 3, 
// and node 1 is the twin of node 2. These are the only nodes with twins for n = 4.
// The twin sum is defined as the sum of a node and its twin.
// Given the head of a linked list with even length, return the maximum twin sum of the linked list.

func pairSum(_ head: ListNode?) -> Int {
    var slow = head, fast = head
    var previous: ListNode? = nil

    while let fastNode = fast, let next = fastNode.next {
        var slowNext = slow?.next
        slow?.next = previous
        previous = slow
        slow = slowNext
        fast = next.next
    }

    var result = 0

    while let slowNode = slow, let previousNode = previous {
        result = max(result, slowNode.val + previousNode.val)
        slow = slowNode.next
        previous = previousNode.next
    }

    return result
}
