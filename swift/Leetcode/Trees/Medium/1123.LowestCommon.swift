    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ root: TreeNode?) -> (Int, TreeNode?) {
            guard let root = root else {
                return (0, nil)
            }

            let left = dfs(root.left)
            let right = dfs(root.right)

            if left.0 > right.0 {
                return (left.0 + 1, left.1)
            }
            if left.0 < right.0 {
                return (right.0 + 1, right.1)
            }
            return (left.0 + 1, root)
        }
        return dfs(root).1
    }
