//Given the head of a singly linked list, reverse the list, 
//and return the reversed list.

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var current = head
    var previous: ListNode?

    while current != nil {
        let nextNode = current?.next
        current?.next = previous
        previous = current
        current = nextNode
    }

    return previous
}

//[1,2,3,4,5]