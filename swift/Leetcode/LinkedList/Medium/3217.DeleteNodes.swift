// You are given an array of integers nums and the head of a linked list. 
// Return the head of the modified linked list after 
// removing all nodes from the linked list that have a value 
// that exists in nums.

// Time: O(n), Space: O(n)
func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
    var numbers = Set(nums)
    let newNode = ListNode(0, head)
    var previous = newNode
    var current = head

    while let node = current {
        if numbers.contains(node.val) {
            previous.next = node.next
        } else {
            previous = node
        }

        current = node.next
    }

    return newNode.next
}