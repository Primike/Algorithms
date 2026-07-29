class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        
        var slow = head
        var fast = head?.next?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        slow?.next = slow?.next?.next
        return head
    }
}