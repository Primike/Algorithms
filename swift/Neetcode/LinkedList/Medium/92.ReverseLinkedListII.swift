// Given the head of a singly linked list and two integers left and 
// right where left <= right, reverse the nodes of the list from 
// position left to position right, and return the reversed list.

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    let newList = ListNode(0, head)
    var leftNode: ListNode? = newList, current = head

    for _ in 0..<(left - 1) {
        leftNode = current
        current = current?.next
    }

    var previous: ListNode? = nil

    for _ in 0...(right - left) {
        let next = current?.next
        current?.next = previous
        previous = current
        current = next
    }

    leftNode?.next?.next = current
    leftNode?.next = previous

    return newList.next
}