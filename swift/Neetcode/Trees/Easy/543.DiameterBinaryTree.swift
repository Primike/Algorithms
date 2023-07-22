//Given the root of a binary tree, return the length of the diameter of the tree.

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var result = 0

    func longestPath(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = longestPath(root.left)
        let right = longestPath(root.right)

        result = max(result, left + right)

        return max(left, right) + 1
    }

    longestPath(root)
    return result
}

