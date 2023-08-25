//You are given two non-empty linked lists representing two non-negative integers. 
//The digits are stored in reverse order, and each of their nodes contains a single digit. 
//Add the two numbers and return the sum as a linked list.

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let newList = ListNode(0)
    var current = newList
    var list1 = l1, list2 = l2
    var carry = 0

    while list1 != nil || list2 != nil || carry != 0 {
        let value1 = list1?.val ?? 0
        let value2 = list2?.val ?? 0

        let total = value1 + value2 + carry
        carry = total / 10

        let newNode = ListNode(total % 10)
        current.next = newNode
        current = newNode

        list1 = list1?.next
        list2 = list2?.next
    }

    return newList.next
}
