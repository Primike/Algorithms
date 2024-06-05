// Given the root of a binary tree, return an array of the 
// largest value in each row of the tree (0-indexed).

// Time: O(n), Space: O(n)
func largestValues(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var result = [Int]()
    var queue = [root]

    while !queue.isEmpty {
        var largest = Int.min

        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            largest = max(largest, first.val)

            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }
        }

        result.append(largest)
    }

    return result
}