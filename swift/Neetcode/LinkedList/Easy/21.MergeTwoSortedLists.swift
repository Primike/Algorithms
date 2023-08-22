//You are given the heads of two sorted linked lists list1 and list2.
//Merge the two lists in a one sorted list. 
//The list should be made by splicing together the nodes of the first two lists.
//Return the head of the merged linked list.

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var newNode = ListNode()
    var current = newNode
    var list1 = list1, list2 = list2

    while let node1 = list1, let node2 = list2 {
        if node1.val > node2.val {
            current.next = node2
            current = node2
            list2 = node2.next
        } else {
            current.next = node1
            current = node1
            list1 = node1.next
        }
    }

    if let node1 = list1 { current.next = node1 }
    if let node2 = list2 { current.next = node2 }

    return newNode.next
}
