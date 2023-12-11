// Given the heads of two singly linked-lists headA and headB, 
// return the node at which the two lists intersect. 
// If the two linked lists have no intersection at all, return null.

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var listA = headA
    var listB = headB

    while listA !== listB {
        listA = listA != nil ? listA?.next : headB
        listB = listB != nil ? listB?.next : headA
    }

    return listA
}

