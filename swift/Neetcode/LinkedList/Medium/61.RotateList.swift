// Given the head of a linked list, rotate the list to the right by k places.

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil { return nil }

    var count = 1
    var endNode = head

    while let node = endNode, let next = node.next {
        endNode = next
        count += 1
    }

    if k % count == 0 { return head }

    count = count - k % count - 1
    var current = head

    for i in 0..<count {
        current = current?.next
    }

    var newNode = current?.next
    endNode?.next = head
    current?.next = nil

    return newNode
}