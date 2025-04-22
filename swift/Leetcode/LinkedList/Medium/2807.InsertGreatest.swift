// Given the head of a linked list head, 
// in which each node contains an integer value.
// Between every pair of adjacent nodes, insert a new node 
// with a value equal to the greatest common divisor of them.
// Return the linked list after insertion.
// The greatest common divisor of two numbers is the 
// largest positive integer that evenly divides both numbers.

func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
    func euclidean(_ x: Int, _ y: Int) -> Int {
        var x = x
        var y = y

        while y != 0 {
            let remainder = x % y
            x = y
            y = remainder
        }

        return x
    }

    var current = head

    while let node = current, let next = node.next {
        let gcd = euclidean(node.val, next.val)
        let newNode = ListNode(gcd, next)
        node.next = newNode
        current = next
    }

    return head
}