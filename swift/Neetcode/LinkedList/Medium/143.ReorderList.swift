//You are given the head of a singly linked-list. The list can be represented as:
//L0 → L1 → … → Ln - 1 → Ln
//Reorder the list to be on the following form:
//L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

func reorderList(_ head: ListNode?) {
    var slow = head, fast = head

    while let f = fast, let next = f.next {
        slow = slow?.next
        fast = next.next
    }

    var newNode: ListNode?
    while let _ = slow {
        var next = slow?.next
        slow?.next = newNode
        newNode = slow
        slow = next
    }

    var left = head, right = newNode
    while let r = right, let next = r.next {
        var nextRight = right?.next
        var nextLeft = left?.next

        left?.next = right
        right?.next = nextLeft

        left = nextLeft
        right = nextRight
    }
}
