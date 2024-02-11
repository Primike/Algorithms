// For example, if n = 4, then node 0 is the twin of node 3, 
// and node 1 is the twin of node 2. These are the only nodes with twins for n = 4.
// The twin sum is defined as the sum of a node and its twin.
// Given the head of a linked list with even length, return the maximum twin sum of the linked list.

func pairSum(_ head: ListNode?) -> Int {
    var slow = head, fast = head
    var previous: ListNode? = nil

    while let next2 = fast?.next {
        var next1 = slow?.next
        slow?.next = previous
        previous = slow
        slow = next1
        fast = next2.next
    }

    var result = 0

    while let node1 = slow, let node2 = previous {
        result = max(result, node1.val + node2.val)
        slow = node1.next
        previous = node2.next
    }

    return result
}