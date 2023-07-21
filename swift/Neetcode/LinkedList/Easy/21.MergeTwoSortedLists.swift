//You are given the heads of two sorted linked lists list1 and list2.
//Merge the two lists in a one sorted list. 
//The list should be made by splicing together the nodes of the first two lists.
//Return the head of the merged linked list.

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let newNode = ListNode(0)
    var current = newNode
    var list1 = list1
    var list2 = list2

    while let l1 = list1, let l2 = list2 {
        if l1.val < l2.val {
            current.next = l1
            list1 = l1.next
        } else {
            current.next = l2
            list2 = l2.next
        }

        current = current.next!
    }

    if let l1 = list1 {
        current.next = l1
    } else if let l2 = list2 {
        current.next = l2
    }

    return newNode.next
}
