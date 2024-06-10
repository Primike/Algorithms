// You are given two linked lists: list1 and list2 of sizes n and m respectively.
// Remove list1's nodes from the ath node to the bth node, and put list2 in their place.
// The blue edges and nodes in the following figure indicate the result:
// Build the result list and return its head.

// Time: O(n), Space: O(1)
func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
    let newHead = ListNode(0, list1)
    var left = list1

    for i in 0..<(a - 1) {
        left = left?.next
    }

    var start = left?.next
    var right = start

    for i in 0..<(b - a) {
        right = right?.next
    }

    left?.next = list2
    var list2Tail = list2

    while let next = list2Tail?.next {
        list2Tail = next
    }

    list2Tail?.next = right?.next
    return newHead.next
}