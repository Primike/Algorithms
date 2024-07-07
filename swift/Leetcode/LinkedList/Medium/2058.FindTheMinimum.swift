// Given a linked list head, return an array of length 2 containing 
// [minDistance, maxDistance] where minDistance is the minimum distance 
// between any two distinct critical points and maxDistance is the 
// maximum distance between any two distinct critical points. 
// If there are fewer than two critical points, return [-1, -1].

// Time: O(n), Space: O(1)
func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
    guard var previous = head, var current = previous.next else { return [-1, -1] }

    var smallest = Int.max
    var left = 0, right = 1
    var first = -1

    while let next = current.next {
        if (current.val < previous.val && current.val < next.val) ||
            (current.val > previous.val && current.val > next.val) {

            if first == -1 {
                left = right
                first = right
            } else {
                smallest = min(smallest, right - left)
                left = right
            }
        }

        right += 1
        previous = current
        current = next
    }

    if smallest == Int.max { return [-1, -1] }
    return [smallest, left - first]
}