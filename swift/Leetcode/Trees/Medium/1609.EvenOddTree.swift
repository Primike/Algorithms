// Given the root of a binary tree, return true if the 
// binary tree is Even-Odd, otherwise return false.

// Time: O(n), Space: O(n)
func isEvenOddTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    var queue = [root]
    var isOdd = true

    while !queue.isEmpty {
        var last = isOdd ? Int.min : Int.max

        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            if isOdd, (first.val % 2 == 0 || last >= first.val) { return false }
            if !isOdd, (first.val % 2 != 0 || last <= first.val) { return false }

            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }

            last = first.val
        }

        isOdd = !isOdd
    }

    return true
}