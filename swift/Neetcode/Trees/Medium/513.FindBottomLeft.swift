// Given the root of a binary tree, return the leftmost value 
// in the last row of the tree.

// Time: O(n), Space: O(w)
func findBottomLeftValue(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var queue = [root]
    var result = root.val

    while !queue.isEmpty {
        result = queue[0].val

        for _ in 0..<queue.count {
            let node = queue.removeFirst()

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
    }

    return result
}

func findBottomLeftValue2(_ root: TreeNode?) -> Int {
    var level = 0
    var result = 0

    func dfs(_ node: TreeNode?, _ current: Int) {
        guard let node = node else { return }

        if current > level {
            level = current
            result = node.val
        }

        dfs(node.left, current + 1)
        dfs(node.right, current + 1)
    }

    dfs(root, 1)
    return result
}