// You are given an array of k linked-lists lists, each 
// linked-list is sorted in ascending order.
// Merge all the linked-lists into one sorted linked-list and return it.

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 { return nil }
    if lists.count == 1 { return lists[0] }

    let mid = lists.count / 2
    var list1 = mergeKLists(Array(lists[..<mid]))
    var list2 = mergeKLists(Array(lists[mid...]))

    var newList = ListNode()
    let newHead = newList

    while let node1 = list1, let node2 = list2 {
        if node1.val > node2.val {
            newList.next = node2
            newList = node2
            list2 = node2.next
        } else {
            newList.next = node1
            newList = node1
            list1 = node1.next
        }
    }

    if let node1 = list1 { newList.next = node1 }
    if let node2 = list2 { newList.next = node2 }

    return newHead.next
}