// Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let left = dfs(root.left)
        let right = dfs(root.right)

        if (left != nil || right != nil), (root.val == p?.val || root.val == q?.val) {
            return root
        } else if left != nil, right != nil {
            return root
        } else if root.val == p?.val || root.val == q?.val {
            return root
        }

        if left != nil { return left }
        if right != nil { return right }

        return nil
    }

    return dfs(root)
}
