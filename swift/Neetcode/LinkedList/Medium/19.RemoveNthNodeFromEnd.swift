//Given the head of a linked list, remove the nth node from the end of the list 
//and return its head.

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let newNode = ListNode(0)
    newNode.next = head
    var left: ListNode? = newNode
    var right: ListNode? = head
    
    var count = n
    while count > 0, right != nil {
        right = right?.next
        count -= 1
    }

    while right != nil {
        left = left?.next
        right = right?.next
    }

    left?.next = left?.next?.next
    return newNode.next
}
