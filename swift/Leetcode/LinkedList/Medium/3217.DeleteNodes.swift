// You are given an array of integers nums and the head of a linked list. 
// Return the head of the modified linked list after 
// removing all nodes from the linked list that have a value 
// that exists in nums.

func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
    let nums = Set(nums)
    let newHead = ListNode(0, head)
    var previous = newHead
    var current = head

    while let node = current {
        let next = node.next

        if nums.contains(node.val) {
            previous.next = next
        } else {
            previous = node
        }
        
        current = next
    }

    return newHead.next
}