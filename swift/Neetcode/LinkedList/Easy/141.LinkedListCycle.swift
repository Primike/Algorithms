//Given head, the head of a linked list, determine if the linked list has a cycle.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    
    while let f = fast, let next = f.next {
        slow = slow?.next
        fast = next.next
        
        if slow === fast {
            return true
        }
    }
    
    return false
}
