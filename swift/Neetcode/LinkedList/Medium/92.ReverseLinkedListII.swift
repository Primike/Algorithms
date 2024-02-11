// Given the head of a singly linked list and two integers left and 
// right where left <= right, reverse the nodes of the list from 
// position left to position right, and return the reversed list.

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    let newHead = ListNode(0, head)
    var start: ListNode? = newHead

    for _ in 0..<(left - 1) {
        start = start?.next
    }

    var previous: ListNode? = nil, end = start?.next

    for _ in left...right {
        let next = end?.next
        end?.next = previous
        previous = end
        end = next
    }

    start?.next?.next = end
    start?.next = previous

    return newHead.next
}