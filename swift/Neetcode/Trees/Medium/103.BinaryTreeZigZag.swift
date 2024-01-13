// Given the root of a binary tree, return the zigzag level order 
// traversal of its nodes' values.

// Time: O(n), Space: O(w)
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var result = [[Int]]()
    var queue = [root]

    while !queue.isEmpty {
        var level = [Int]()

        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            level.append(node.val)

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }

        if result.count % 2 != 0 { level = level.reversed() }
        result.append(level)
    }

    return result
}