class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard var current = head else { return 0 }
        
        var num = current.val
        
        while let nextNode = current.next {
            num = (num << 1) | nextNode.val
            current = nextNode
        }
        
        return num
    }
}