// Given the head of a linked list containing k distinct elements, 
// return the head to a linked list of length k containing the frequency
// of each distinct element in the given linked list in any order.

// Time: O(n), Space: O(n)
func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
    var dict = [Int: Int]()
    var current = head

    while let node = current {
        dict[node.val, default: 0] += 1
        current = node.next
    }

    var newHead = ListNode()
    var newNode = newHead

    for number in dict.values {
        let node = ListNode(number)
        newNode.next = node
        newNode = node
    }

    return newHead.next
}