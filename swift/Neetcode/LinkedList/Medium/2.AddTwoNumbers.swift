// You are given two non-empty linked lists representing two non-negative integers. 
// The digits are stored in reverse order, and each of their nodes contains a single digit. 
// Add the two numbers and return the sum as a linked list.

// Time: O(n), Space: O(1)
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    let newHead = ListNode(0) 
    var current: ListNode? = newHead
    var carry = 0

    while l1 != nil || l2 != nil || carry != 0 {
        var sum = carry

        if let node = l1 { sum += node.val }
        if let node = l2 { sum += node.val }

        current?.next = ListNode(sum % 10)
        current = current?.next
        l1 = l1?.next
        l2 = l2?.next

        carry = sum >= 10 ? 1 : 0
    }

    return newHead.next
}