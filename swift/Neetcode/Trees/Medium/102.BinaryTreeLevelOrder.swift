// Given the root of a binary tree, 
// return the level order traversal of its nodes' values. 
// (i.e., from left to right, level by level).

// Time: O(n), Space: O(w)
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var result = [[Int]]()
    var queue = [root]

    while !queue.isEmpty {
        var level = [Int]()

        for i in 0..<queue.count {
            let node = queue.removeFirst()
            level.append(node.val)

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }

        result.append(level)
    }

    return result
}