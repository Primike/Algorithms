// Given the root of a binary tree, return the length of the diameter of the tree.

// Time: O(n), Space: O(h)
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left)
        let right = dfs(root.right)

        result = max(result, left + right)
        return max(left, right) + 1
    }

    dfs(root)
    return result
}

