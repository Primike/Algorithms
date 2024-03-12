// For every pair, we compare the values of the nodes in the pair:
// If the odd-indexed node is higher, the "Odd" team gets a point.
// If the even-indexed node is higher, the "Even" team gets a point.
// Return the name of the team with the higher points, 
// if the points are equal, return "Tie".

// Time: O(n), Space: O(1)
func gameResult(_ head: ListNode?) -> String {
    var head = head
    var result = 0

    while let even = head, let odd = even.next {
        if odd.val > even.val {
            result += 1
        } else if even.val > odd.val {
            result -= 1
        }

        head = odd.next
    }

    if result == 0 { return "Tie" }
    return result < 0 ? "Even" : "Odd"
}