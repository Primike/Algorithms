// Given the root of a binary tree, check whether it is a mirror of itself

// Time: O(n), Space: O(h)
func isSymmetric(_ root: TreeNode?) -> Bool {
    func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        guard let p = p, let q = q, p.val == q.val else { return false }

        return dfs(p.left, q.right) && dfs(p.right, q.left)
    }

    return dfs(root?.left, root?.right)
}