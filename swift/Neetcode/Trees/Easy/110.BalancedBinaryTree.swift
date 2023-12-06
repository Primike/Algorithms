//Given a binary tree, determine if it is height-balanced.

func isBalanced(_ root: TreeNode?) -> Bool {
    var result = true

    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        let left = dfs(node.left)
        let right = dfs(node.right)

        if abs(left - right) > 1 { result = false }

        return 1 + max(left, right)
    }

    dfs(root)
    return result
}

func isBalanced(_ root: TreeNode?) -> Bool {
    var result = 0

    func depthFirst(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = depthFirst(root.left)
        let right = depthFirst(root.right)

        result = max(result, abs(left - right))
        return max(left, right) + 1
    }

    depthFirst(root)
    return result <= 1
}