//You are given two non-empty linked lists representing two non-negative integers. 
//The digits are stored in reverse order, and each of their nodes contains a single digit. 
//Add the two numbers and return the sum as a linked list.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let newNode = ListNode(0)
    var current = newNode

    var carry = 0
    var list1 = l1, list2 = l2

    while list1 != nil || list2 != nil || carry != 0 {
        let value1 = list1?.val ?? 0
        let value2 = list2?.val ?? 0

        let total = value1 + value2 + carry
        carry = total / 10

        current.next = ListNode(total % 10)
        current = current.next!

        list1 = list1?.next
        list2 = list2?.next
    }

    return newNode.next
}
