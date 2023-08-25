//Given the head of a linked list, return the list after sorting it in ascending order.

func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }

    var slow = head, fast = head
    var prev: ListNode?

    while let fastNode = fast, let next = fastNode.next {
        prev = slow
        slow = slow?.next
        fast = next.next
    }
    prev?.next = nil

    var list1 = sortList(head)
    var list2 = sortList(slow)

    var newList = ListNode()
    let newHead = newList

    while let node1 = list1, let node2 = list2 {
        if node1.val > node2.val {
            newList.next = node2
            list2 = node2.next
        } else {
            newList.next = node1
            list1 = node1.next
        }
        
        newList = newList.next!
    }

    if list1 != nil { 
        newList.next = list1 
    } else if list2 != nil { 
        newList.next = list2 
    }

    return newHead.next
}