// Given the head of a singly linked list and an integer k, 
// split the linked list into k consecutive linked list parts.

func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
    var length = 0
    var current = head

    while current != nil { 
        current = current?.next
        length += 1
    }

    var result = [ListNode?](), k = k
    current = head

    while k > 0 {
        let node = current
        let count = (length % k == 0) ? (length / k) : ((length + k) / k)

        for _ in 0..<(max(0, count - 1)) {
            current = current?.next
        }

        let next = current?.next
        current?.next = nil
        result.append(node)

        current = next
        length -= count
        k -= 1
    }

    return result
}