// Given the head of a linked list, rotate the list to the right by k places.

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil { return nil }

    var length = 1, end = head

    while end?.next != nil {
        length += 1
        end = end?.next
    }

    if k % length == 0 { return head }

    let n = length - k % length - 1     
    var current = head

    for _ in 0..<n {
        current = current?.next
    }

    var newHead = current?.next
    end?.next = head
    current?.next = nil

    return newHead
}