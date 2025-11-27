// Given the root of a binary tree, return the 
// lowest common ancestor of its deepest leaves.

// Time: O(n), Space: O(h)
func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
    func dfs(_ root: TreeNode?) -> (TreeNode?, Int) {
        guard let root = root else { return (nil, 0) }

        let (left, leftDepth) = dfs(root.left)
        let (right, rightDepth) = dfs(root.right)

        if leftDepth > rightDepth { return (left, leftDepth + 1) }
        if leftDepth < rightDepth { return (right, rightDepth + 1) }

        return (root, leftDepth + 1)
    }

    return dfs(root).0
}