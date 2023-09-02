// Given the root of a binary tree, return the maximum path sum of any non-empty path.

func maxPathSum(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = Int.min

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = max(0, dfs(root.left)) 
        let right = max(0, dfs(root.right)) 

        result = max(result, root.val + left + right)

        return root.val + max(left, right)
    }

    dfs(root)
    return result
}